class GitNP
  def setup(project_name)
    # Create directory
    if Dir.exist?(project_name)
      failure 'Sorry, a directory with same name already exists...' 
    else
      begin
        Dir.mkdir(project_name)
        success 'Finished generating project directory...'
      rescue Exception => e
        failure "Error in creating the project directory : #{e}"
      end
    end

    # Create markdown files from template
    @opts['file_templates'].each do |generated_file_name, template_content|
      begin
        File.open("#{project_name}/#{generated_file_name}", 'w') do |file|
          file.write(template_content.result(binding))
        end
        sucess "Finished generating #{generated_file_name} file..."
      rescue Exception => e
        failure "Error in generating #{generated_file_name} file : #{e}"
      end
    end

    # TODO : Apply Git add, Git commit and cd to the new project.
  end
end
