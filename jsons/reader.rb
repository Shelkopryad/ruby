require 'json'

file = File.read "gpu_driver_bug_list.json"
data = JSON.parse(file)

data['entries'].each do |entrie|
  unless entrie['os'].nil?
    if entrie['os']['type'] == 'win'
      p "#{entrie['os']['type']}: #{entrie['description']}"
    end
  end
end