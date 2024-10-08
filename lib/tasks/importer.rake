class Importer
  def initialize(name)
    @classname = nil
    @oid = nil
    @version = ImportVersion.find_or_create_by({name: name})
    @is_new = false
  end
  def addLog()
    raise "Importer classname is null" if @classname.blank?
    raise "Importer Object is null" if @oid.blank?
    ImportLog.create({
      import_version: @version,
      object_type: @classname,
      object_id: @oid
    })
  end
  def createObj(classname, data)
    @is_new = false
    @classname = classname
    obj = classname.find_by data
    if obj.nil?
      begin
        puts "\nIMPORTER OBJ: #{data.inspect}\n\n"
        obj = classname.create data
        obj.save
        @oid = obj.id
        self.addLog
        @is_new = true
      rescue ArgumentError => err
        puts "\n Error: #{err} en:\n #{data.inspect}\n\n"
      end
    else
      @oid = obj.id
    end
    return obj
  end
end
namespace :import do
  task :test, [:name] => :environment do |_, args|
    #Rake::Task["import:services"].invoke("test-serv_data2", "servicios-aux.csv")
    #ServiceTag.create(service_id: 6, tag: "Facultad de Arquitectura, Diseño y Urbanismo")
    #Rake::Task["import:service_data"].invoke("test-serv_data", "servicios-ingreso-estudiantes.csv", 1)
    #Rake::Task["import:service_data"].reenable
    #Rake::Task["import:service_data"].invoke("test-serv_data2", "servicios-estudiantes_actives-2020.csv", 2)
    Rake::Task["import:places"].invoke("test-places10", "Places-UDELAR2.csv")
    Rake::Task["import:intangibles"].invoke("test-intangibles10", "Intangibles-UDELAR2.csv")
  end
  task :all, [:name] => :environment do |_, args|
    if args[:name].present?
      import_name = args[:name]
    else
      import_name = 'initial'
    end
    puts "\nSTARTalling\n"
    Rake::Task["import:services"].invoke("#{import_name}-servicios", "servicios.csv")
    puts "\n\nCalling data-types\n"
    Rake::Task["import:serv_data_types"].invoke("#{import_name}-serv_data_types", "stypes.csv")
    puts "\n\nCalling DOCENTES\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-docentes", "servicios-docentes.csv", "docente")
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling FUNCIONARIES\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-funcionaries", "servicios-funcionaries.csv", "funcionarie")
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling POSTGRADOS\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-servicios-ingreso-posgrados", "servicios-ingreso-posgrados.csv", 4)
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling INGRESOS\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-servicios-ingreso-estudiantes", "servicios-ingreso-estudiantes.csv", 1)
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling EGRESOS\n"
    Rake::Task["import:service_data"].invoke("test-serv_data", "servicios-egresos-2019.csv", 3)
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling ACTIVOS\n"
    Rake::Task["import:service_data"].invoke("test-serv_data2", "servicios-estudiantes_actives-2020.csv", 2)
    puts "\n\nCalling LUGARES\n"
    Rake::Task["import:places"].invoke("#{import_name}-places", "Places-UDELAR2.csv")
    puts "\n\nCalling INTANGIBLES\n"
    Rake::Task["import:intangibles"].invoke("#{import_name}-intangibles", "Intangibles-UDELAR2.csv")
  end
  ###########################
  task :services, [:name] => :environment do |_, args|
    if args[:name].present?
      import_name = args[:name]
    else
      import_name = 'services-initial'
    end
    puts "\nSTARTalling\n"
    puts "\n\nCalling DOCENTES\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-docentes", "servicios-docentes-2024.csv", "docente")
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling FUNCIONARIES\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-funcionaries", "servicios-funcionaries-2024.csv", "funcionarie")
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling POSTGRADOS\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-servicios-ingreso-posgrados", "servicios-ingreso_posgrados-2022.csv", 4)
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling INGRESOS\n"
    Rake::Task["import:service_data"].invoke("#{import_name}-servicios-ingreso-estudiantes", "servicios-ingreso_estudiantes-2022.csv", 1)
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling EGRESOS\n"
    Rake::Task["import:service_data"].invoke("test-serv_data", "servicios-egresos-2021.csv", 3)
    Rake::Task["import:service_data"].reenable
    puts "\n\nCalling ACTIVOS\n"
    Rake::Task["import:service_data"].invoke("test-serv_data2", "servicios-estudiantes_actives-2023.csv", 2)
  end
  task :places, [:name, :file] => :environment do |_, args|
    file = args[:file].present? ? args[:file] : 'Places-UDELAR.csv'
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
        puts "LINE: #{i}\n"
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
        place_data = {
          building_id: building.id,
          name: row[5],
          detail: row[4],
          serv_data_type: ptype,
          naming_details: row[8],
          naming_date: naming_date
        }

        place = import.createObj(Place, place_data)
        if people
          if !place.person_ids.include?(person.id)
            puts "IS NEW UPDATE\n"
            place.people << person
          end
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
      'Campeonato ',
      'Documentos donados por ',
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
        puts "LINE: #{i}\n"
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
        if !intan.service_ids.include? uservice.id
          intan.services << uservice
        end
        if add_person
          if !intan.person_ids.include?(@person.id)
            intan.people << @person
          end
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
    puts "SERVICE DATA\n"
    if args[:name].present? && args[:file].present? && args[:type].present?
      file = args[:file]
      import_name = args[:name]
      stype = args[:type]
      stypes = ServDataType.where({model_type: stype}).order(:weight)
      #year = file.split('-')[2]
      year = 2024
    else
      puts "NO ENCONTRADO\n"
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
                year: year
                })
              j += 1
            end
          end
        else
          @import.createObj(ServiceDatum, {
            service: service,
            serv_data_type_id: stype,
            man: row[1].tr('.',''),
            woman: row[2].tr('.',''),
            year: year
            })
        end
      rescue ArgumentError => err
        puts "\n ERROR error: #{err} en línea: #{i} \n"
      end
    end
  end
  #
  task :serv_data_types, [:name] => :environment do |_, args|
    i = 0;
    if args[:name].present?
      import_name = args[:name]
    else
      next
    end
    @import = Importer.new(import_name)
    CSV.foreach("db/data/stypes.csv") do |row|
      i += 1
      stype = @import.createObj(ServDataType, {
        model_type: row[0],
        stype: row[1],
        name: row[2],
        weight: i,
      })
      stype.icon = {io: File.open('app/assets/images/ico-mujer.svg'), filename: "ico-mujer"}
      stype.save
      #if ServDataType.find_by(stype_data).nil?
      #  stype_data['icon'] = {io: File.open('app/assets/images/ico-mujer.svg'), filename: "ico-mujer"}
      #  ServDataType.create stype_data
      #end
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
    puts "Importing file db/data/#{file}"
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
