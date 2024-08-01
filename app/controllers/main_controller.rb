class MainController < ApplicationController
  def home
    respond_to do |format|
      format.js {
        if params[:query].present? && params[:query].size > 2
          results = Person.where("lower(name) like ?", "%#{params[:query].downcase}%")
          if params[:type].present?
            if params[:type] == 'Todo'
              @results = results + Thing.where("lower(name) like ?", "%#{params[:query].downcase}%")
            else
              @results = results.where(sex: "#{params[:type]}")
            end
          else
            @results = results.where(sex: "Femenino")
          end
        elsif params[:type].present?
          if params[:type] == 'Todo'
            @results = Person.all + Thing.all
          else
            @results = Person.where(sex: "#{params[:type]}")
          end
        end
        @ptype = []
        if params[:sid].present?
          @ptype = places_with_name
        end
        @load_graphs = true;
        get_totals
      }
      format.html{
        #Contador para gráfica de totales
        #Totales de lugares
        type_count = Place.joins(:people).group('people.sex').count
        intangible_count = Intangible.joins(:people).group('people.sex').count
        total_count = type_count.merge(intangible_count) { |k, o, n| o + n }
        logger.info { "\n\nTYPE COUNT:\n #{intangible_count}\n\n" }
        logger.info { "\n\nINTANGIBLE COUNT:\n #{type_count}\n\n" }
        logger.info { "\n\nTOTAL COUNT:\n #{total_count}\n\n" }
        thing_count = Place.where.not(thing_id:nil).count + Intangible.where.not(thing_id:nil).count
        @type = 'Femenino'
        #Sumo Hobre-mujer Mujer-hombre a cada uno
        hombres = total_count[0] + total_count[2].to_i + total_count[3].to_i
        mujeres = total_count[1] + total_count[2].to_i + total_count[3].to_i
        #Arrange series
        per_type_series = []
        per_type_series << { name: "Cantidad", data: [ {x: "Hombres", y: hombres}, {x: "Mujeres", y: mujeres}, {x: "Cosas", y: thing_count} ], type: 'column' }
        #per_type_series << { name: "Mujeres", data: [type_count[1]], type: 'column' }
        #per_type_series << { name: "Otro", data: [thing_count], type: 'column' }
        @per_type_series = per_type_series.to_json
        # TODO: Ver cómo calcularlo
        @percentage_woman = ( type_count[1] * 10.0 / (type_count.values.reduce( :+ ) + thing_count) ).round(1)
        @percentage_things = ( thing_count * 10.0 / (type_count.values.reduce( :+ ) + thing_count) ).round(1)
        #@sex_count = Place.joins(:person).group('people.sex').count
        #random persons to list
        #female = Person.where(sex: @type).count
        #offset = rand(female)
        @results = Person.where(sex: @type).limit(10)#offset(female - offset < 10 ? female - 10 : offset).limit(10)
        #servicios para filtro
        @services = Service.all.order(:sweight)
        #Contador para ptype de places por servicio
        @ptype = places_with_name
        #Get series for evolution
        @ev_series = Event.select(:edate, :etype, :value).where(etype: ['Masculino', 'Femenino']).to_json
        #Get totals
        @load_graphs = false;
        get_totals
      }
    end
  end
  #Total number of students per service
  def get_totals
    @year = 2024
    @total_woman = {}
    @models = {}
    totals = ServiceDatum.select('serv_data_type, woman, man').where(year: @year)
    total_woman = ServiceDatum.select('serv_data_type, woman').where(year: @year)
    if params[:sid].present? && params[:sid].to_i > 0
      totals = totals.where(service_id: params[:sid])
      total_woman = total_woman.where(service_id: params[:sid])
    end
    totals = totals.group(:serv_data_type).sum('woman + man')
    total_woman = total_woman.group(:serv_data_type).sum('woman')
    total_woman.merge!(totals){|key, woman, all| (woman || 0)*100/(all != 0 ? all : 1)}
    total_woman.each { |k,v|
      @total_woman[k.stype] = v
    }
    ServDataType.order(:weight).all.each { |k|
      if @models[k.model_type].present?
        @models[k.model_type][k.stype] = k
      else
        @models[k.model_type] = { k.stype => k }
      end
    }
    #logger.info { "\n\nMODELOS #{@models.inspect}\n\n" }
  end
  #Counts per Place type
  def places_with_name
    ptype_women = places_type_by_sex([1,2,3])
    ptype_total = places_type_by_sex([])
    ptype = {}
    ptype_total.each do |place, count|
      if ptype_women[place].present?
        ptype[place] = ptype_women[place] * 100 / count
      else
        ptype[place] = 0
      end
    end
    ptype
  end
  #Contador para ptype de places por servicio
  def places_type_by_sex(sexes)
    if ( params[:sid].present? && params[:sid].to_i > 0 )
      q = Place.
      joins(building:[:services]).
      where("buildings_services.service_id": [params[:sid]])
      if sexes.blank?
        res = q.joins(:serv_data_type)
      else
        res = q.includes(:people, :serv_data_type).where('people.sex': sexes)
      end
    else
      if sexes.blank?
        res = Place.joins(:serv_data_type)
      else
        res = Place.includes(:people, :serv_data_type).where('people.sex': sexes)
      end
    end
    res.group(:serv_data_type).
    order(:weight).
    count
  end
  #
  def places_types_totals
    Place.includes(:people).
    where('people.sex': sexes).
    group(:serv_data_type).
    count
  end

  def search
    if ( params[:q].length > 2 )
      @str = params[:q].downcase
      render json: Person.search(@str).limit(10).sort_by! {|r| r[:name]}
    else
      render json: {error: 'Insuficient parameter length, at least 3 charachters are required'}
    end
  end
end
