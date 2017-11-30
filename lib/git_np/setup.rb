class GitNP
  def setup(project_name)
    # Create directory
    raise 'Sorry, a directory with same name already exists here' if Dir.exist?(project_name)
    Dir.mkdir(project_name)

    # Create markdown files from template
    @opts['file_templates'].each do |generated_file_name, template_content|
      File.open("#{project_name}/#{generated_file_name}", 'w') do |file|
        file.write(template_content.result(binding))
      end
    end

    # TODO : Read from licenses.json for license_wording
    #   while creating LICENSE.md file.

    # TODO : Apply Git add, Git commit and cd to the new project.
  end
end
