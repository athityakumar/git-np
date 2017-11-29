require 'mechanize'
require 'json'

def scrape_license(url)
  agent   = Mechanize.new.get(url)
  heading = agent.search('.page-title')
                 .text
  wording = agent.search('.field-item p')
                 .map { |p| p.text.strip }
                 .join("\n")

  puts "Scraped #{heading}..."
  [heading, wording]
end

base_url         = 'https://opensource.org'
agent            = Mechanize.new.get("#{base_url}/licenses/alphabetical")
list_of_licenses = agent.search('.field-item li a')
                        .map do |license| 
                          license_name                     = license.text
                          license_url                      = "#{base_url}#{license['href']}"
                          license_heading, license_wording = scrape_license(license_url)

                          {
                            'license_name'    => license_name,
                            'license_heading' => license_heading,
                            'license_wording' => license_wording
                          }
                        end

file_name = 'licenses.json'
File.delete(file_name) if File.exist?(file_name)
File.open('licenses.json', 'a') { |f| f.write(JSON.pretty_generate(list_of_licenses))} 
