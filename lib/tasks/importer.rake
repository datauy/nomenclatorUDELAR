class Importer
  def initialize(name)
    @classname = nil
    @oid = nil
    @version = ImportVersion.find_or_create_by({name: name})
  end
  def addLog()
    raise "Importer classname is null" if @classname.blank? || @oid.blank?
    ImportLog.create({
      import_version: @version,
      object_type: @classname,
      object_id: @oid
    })
  end
  def createObj(classname, data)
    @classname = classname
    @oid = nil
    obj = classname.find_by data
    if obj.nil?
      obj = classname.create data
      obj.save
      @oid = obj.id
      self.addLog
    end
    return obj
  end
end
namespace :import do
  task :all, [:name] => :environment do |_, args|
    if args[:name].present?
      import_name = args[:name]
    else
      import_name = 'initial'
    end
    puts "\n\ncalling\n"
    #Rake::Task["import:services"].invoke("#{import_name}-servicios", "servicios.csv")
    #Rake::Task["import:serv_data_types"].invoke("#{import_name}-serv_data_types", "stypes.csv")
    #Rake::Task["import:service_data"].invoke("#{import_name}-docentes", "servicios-docentes.csv", "docente")
    #Rake::Task["import:service_data"].invoke("#{import_name}-funcionaries", "servicios-funcionaries.csv", "funcionarie")
    #Rake::Task["import:service_data"].invoke("#{import_name}-funcionaries-ingreso-posgrados", "servicios-ingreso-posgrados.csv", 4)
    #Rake::Task["import:service_data"].invoke("#{import_name}-funcionaries-ingreso-estudiantes", "servicios-ingreso-estudiantes.csv", 1)
    Rake::Task["import:places"].invoke("#{import_name}-places", "PlanillasUnificadas-20210720-Lugares.csv")
    #Rake::Task["import:intangibles"].invoke("#{import_name}-intangibles", "PlanillasUnificadas-20210720-Intangibles.csv")
  end
  ###########################
  task :places, [:name, :file] => :environment do |_, args|
    file = args[:file].present? ? args[:file] : 'PuntosProgramas.csv'
    if args[:name].present?
      import_name = args[:name]
    else
      next
    end
    require 'csv'
    prefix = [
      'Biblioteca ',
      'Sala de ',
      'exposiciones ',
      'Exposiciones ',
      'Exposición ',
      'Casa ',
      'Sala '
    ]
    import = Importer.new(import_name)
    i = 0
    CSV.foreach("db/data/#{file}", headers: true) do |row|
      begin
        i = i + 1
        uservice = Service.search(row[0])
        if uservice.blank?
          puts "\nServicio no encontrado: #{row[0]}\n\n"
          next
        end
        #uservice = import.createObj(Service, {name: row[0]})
        building = import.createObj(Building, {
          name: row[1],
          address: row[2],
          })
        building.services << uservice
        building.save
        pname = "#{row[5]}"
        if pname.empty?
          puts "El nombre del espacio está vacío, fila: #{i}"
          next
        end
        prefix.each do |pre|
          pname.slice! pre
        end
        sex = row[6]
        people = true
        if row[6].present? && row[6] != '-'
          if row[6] == "Varón" || row[6] == "varón"
            sex = "Masculino"
          elsif row[6] == "mujer" || row[6] == "Mujer"
            sex = "Femenino"
          end
          person = import.createObj(Person, {
            name: pname,
            sex: sex,
            bio: "#{row[7]}"
            })
        else
          people = false
          #thing
          thing = import.createObj(Thing, {
            name: pname,
            ttype: 0,
            description: "#{row[10]}"
            })
        end

        if row[9].present?
          naming_date = Date.parse row[9]
        else
          naming_date = nil
        end
        #Place Type
        type = row[3]
        if type == 'Otro (Especificar)'
          type = row[4]
        end
        ptype = ServDataType.where({model_type: 3, name: type}).first
        if ptype.nil?
          ptype = ServDataType.where({model_type: 3, name: 'Otro'}).first
        end
        place = import.createObj(Place, {
          building_id: building.id,
          name: row[5],
          detail: row[4],
          serv_data_type: ptype,
          naming_details: row[8],
          naming_date: naming_date
          })
        if people
          place.people << person
        else
          place.thing_id = thing.id
          place.save
        end
      rescue ArgumentError => err
        puts "\n Argument error: #{err} en línea: #{i} \n #{row.inspect}\n\n"
      end
    end
  end
  task :intangibles, [:name, :file] => :environment do |_, args|
    prefix = [
      'Taller ',
      'Colección ',
      'Campeonato '
    ]
    if args[:name].present? && args[:file].present?
      file = args[:file]
      import_name = args[:name]
    else
      next
    end
    require 'csv'
    @import = Importer.new(import_name)
    i = 0
    CSV.foreach("db/data/#{file}", headers: true) do |row|
      begin
        i = i + 1
        uservice = Service.search(row[0])
        if uservice.blank?
          puts "\nServicio no encontrado: #{row[0]}\n\n"
          next
        end
        pname = "#{row[4]}"
        if pname.empty?
          puts "El nombre del espacio está vacío, fila: #{i}"
          next
        end
        prefix.each do |pre|
          pname.slice! pre
        end
        add_person = create_person?(row[5], pname, row[6])

        naming_date = nil
        if row[8].present?
          # TODO: Revisar si funciona borrar get_date y sino llamar a get_date
          naming_date = Date.parse row[8] || nil
        end

        intan = @import.createObj(Intangible, {
          name: row[4],
          noun: row[2],
          detail: row[3],
          observations: row[9],
          naming_details: row[7],
          naming_date: naming_date
          })

        intan.services << uservice
        if add_person
          intan.people << @person
        else
          intan.thing_id = @thing.id
          intan.save
        end
      rescue ArgumentError => err
        puts "\n Argument error: #{err} en línea: #{i} \n #{row.inspect}\n\n"
      end
    end
  end
  task :events, [:name, :file] => :environment do |_, args|
    if args[:name].present? && args[:file].present?
      file = args[:file]
      import_name = args[:name]
    else
      next
    end
    require 'csv'
    @import = Importer.new(import_name)
    i = 0
    CSV.foreach("db/data/#{file}", headers: true) do |row|
      begin
        i = i + 1
        @import.createObj(Event, {
          edate: row[0],
          etype: row[1],
          value: row[2]
        })
      rescue ArgumentError => err
        puts "\n ERROR error: #{err} en línea: #{i} \n"
      end
    end
  end
  task :service_data, [:name, :file, :type] => :environment do |_, args|
    if args[:name].present? && args[:file].present? && args[:type].present?
      file = args[:file]
      import_name = args[:name]
      stype = args[:type]
      stypes = ServDataType.where({model_type: stype}).order(:weight)
    else
      next
    end
    puts "\n\nSTYPE: #{stype}\n"
    require 'csv'
    @import = Importer.new(import_name)
    i = 0
    CSV.foreach("db/data/#{file}", headers: true) do |row|
      begin
        i = i + 1
        service = Service.search(row[0])
        if service.blank?
          puts "\nServicio no encontrado: #{row[0]}\n\n"
          next
        end
        if stype == 'docente' || stype == 'funcionarie'
          if i % 2 == 1
            #combine array of keys with value
            @last_row = row[2..]
          else
            stype_comp = @last_row.zip(row[2..])
            puts "\n#{stype_comp}\n"
            j = 0
            stypes.each do |datum|
              @import.createObj(ServiceDatum, {
                service: service,
                serv_data_type: datum,
                woman: stype_comp[j][0].to_i,
                man: stype_comp[j][1].to_i,
                year: 2021
                })
              j += 1
            end
          end
        else
          @import.createObj(ServiceDatum, {
            service: service,
            serv_data_type_id: stype,
            man: row[1],
            woman: row[2],
            year: 2021
            })
        end
      rescue ArgumentError => err
        puts "\n ERROR error: #{err} en línea: #{i} \n"
      end
    end
  end
  #
  task :serv_data_types, [] => :environment do |_, args|
    i = 0;
    CSV.foreach("db/data/stypes.csv") do |row|
      i += 1
      ServDataType.create(
        {
          model_type: row[0],
          stype: row[1],
          name: row[2],
          weight: i,
          icon: {io: File.open('app/assets/images/ico-mujer.svg'), filename: "ico-mujer"}
        }
      )
    end
  end
  #
  task :services, [:name, :file] => :environment do |_, args|
    if args[:name].present? && args[:file].present?
      file = args[:file]
      import_name = args[:name]
    else
      next
    end
    require 'csv'
    @import = Importer.new(import_name)
    i = 0
    CSV.foreach("db/data/#{file}") do |row|
      begin
        puts row.inspect
        i = i + 1
        service = @import.createObj(Service, {
          name: row[0],
        })
        i = 1
        tag = row[i]
        while tag.present?
          @import.createObj(ServiceTag, {
            tag: tag,
            service: service
          })
          i += 1
          tag = row[i]
        end
      rescue ArgumentError => err
        puts "\n ERROR error: #{err} en línea: #{i} \n"
      end
    end
  end
end
#
def get_date(date_str, i)
  begin
   Date.parse date_str
  rescue ArgumentError => err
    puts "\n Argument error: #{err} en línea: #{i} \n"
    return nil
  end
end
def get_name()

end
def create_person?(cell, name, desc)
  sex = cell
  if cell.present? && cell != '-'
    if cell == "Varón" || cell == "varón"
      sex = "Masculino"
    elsif cell == "mujer" || cell == "Mujer"
      sex = "Femenino"
    end
    @person = @import.createObj(Person, {
      name: name,
      sex: sex,
      bio: "#{desc}"
      })
    return true
  else
    #thing
    @thing = @import.createObj(Thing, {
      name: name,
      ttype: 0,
      description: "#{desc}"
      })
    return false
  end
end
