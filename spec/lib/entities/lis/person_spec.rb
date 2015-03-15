# require 'spec_helper.rb'
require 'require_all'
require_all 'lib/caliper/entities/*.rb'
require_all 'lib/caliper/entities/lis/*.rb'

module Caliper
  module Entities
    module LIS
      describe Person do

        it "should ensure that a Person is correctly created and serialized" do
          student = Person.new
          student.id = 'https://some-university.edu/students/dent_stu'
          student.name = 'Stu Dent'
          student.description = 'A super bright individual'
          student.properties = {'customProp' => 42}
          puts "new student = #{student.to_json}"

          file = File.read('spec/lib/entities/lis/student.json')
          data_hash = JSON.parse(file)
          puts "JSON from file = #{data_hash}"

          des_student = Person.from_json data_hash
          puts "Object from JSON = #{des_student.to_json}"

          puts student.eql?(des_student)
          # expect().not_to include(:some_other_key)
        end

      end
    end
  end
end