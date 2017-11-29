class GitNP
  def read_markdown_templates
    @opts['file_templates'].map do |generated_file_name, template_file_name|
      template_content = read_markdown_template(template_file_name)
      
      [
        generated_file_name,
        template_content
      ]
    end.to_h
  end

  private

  def read_markdown_template(file_name)
    file_name = "templates/#{file_name}"

    file_path =
      if File.exist?(fetch_absolute_path(file_name, type: :user))
        fetch_absolute_path(file_name, type: :user)
      else
        fetch_absolute_path(file_name, type: :default)
      end

    ERB.new(File.open(file_path).read, 0, '>')
  end
end
