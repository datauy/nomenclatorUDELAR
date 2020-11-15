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
      obj = classname.new data
      obj.save
      @oid = obj.id
      self.addLog
    end
    return obj
  end
end
namespace :import do
  task :places => :environment do
    require 'csv'
    prefix = [
      'Biblioteca',
      'Sala de',
      'exposiciones',
      'Exposiciones',
      'Exposición',
      'Casa',
      'Sala'
    ]
    import = Importer.new('Prueba1')
    i = 0
    CSV.foreach('db/data/Places-UDELAR-utf8.csv', headers: true) do |row|
      begin
        puts row
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
        if row[6].present?
          if row[6] == "Varón" || row[6] == "varón"
            sex = "Masculino"
          elsif row[6] == "mujer" || row[6] == "Mujer"
            sex = "Femenino"
          end
        end
        person = import.createObj(Person, {
          name: pname,
          sex: sex,
          bio: row[7]
        })
        if row[9].present?
          naming_date = Date.parse row[9]
        else
          naming_date = nil
        end

        import.createObj(Place, {
          building_id: building.id,
          name: row[5],
          detail: row[4],
          ptype: row[3],
          person_id: person.id,
          naming_details: row[8],
          naming_date: naming_date
          })
      rescue ArgumentError => err
        puts "\n Argument error: #{err} en línea: #{i} \n"
      end
    end
  end
end
