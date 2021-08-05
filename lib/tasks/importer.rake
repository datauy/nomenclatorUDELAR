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
    puts data.inspect
    @classname = classname
    @oid = nil
    obj = classname.find_by data
    if obj.nil?
      obj = classname.new data
      obj.save
      @oid = obj.id
      self.addLog
    end
    return obj
  end
end
namespace :import do
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
        uservice = import.createObj(Service, {name: row[0]})
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

        place = import.createObj(Place, {
          building_id: building.id,
          name: row[5],
          detail: row[4],
          ptype: row[3],
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
        puts "\n Argument error: #{err} en línea: #{i} \n"
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
        uservice = @import.createObj(Service, {name: row[0]})
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
        puts "\n ERROR error: #{err} en línea: #{i} \n"
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
end
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
