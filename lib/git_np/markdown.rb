class GitNP
  def read_markdown_templates
    @opts['file_templates'].map do |generated_file_name, template_file_name|
      begin
        if template_file_name
          template_content = read_markdown_template(template_file_name)
          success "Finished reading #{generated_file_name} template..."

          [
            generated_file_name,
            template_content
          ]
        else
          debug "Skipping #{generated_file_name}..."
          next
        end
      rescue Exception => e
        failure "Error in reading #{generated_file_name} template : #{e}"
        next
      end
    end.reject(nil).to_h
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
