class GitNP
  def bootstrap
    # Read from yaml file
    # Store parsed opts
    begin
      parse_opts('config.yaml')
      success 'Finished reading configuration...'
    rescue Exception => e
      failure "Error in reading configuration : #{e}"
    end

    # Read markdown template files
    @opts['file_templates'] = read_markdown_templates
  end

  private

  def parse_opts(env_file_name)
    user_opts      = read_yaml(fetch_absolute_path(env_file_name, type: :user))
    default_opts   = read_yaml(fetch_absolute_path(env_file_name, type: :default))
    file_templates = default_opts['file_templates'].merge(user_opts['file_templates'] || {})

    @opts           = default_opts.merge(user_opts).merge({'file_templates' => file_templates})
    @opts['year'] ||= Date.today.year.to_s
  end

  def fetch_absolute_path(relative_path, type: :default)
    if type == :default
      File.join(File.dirname(__FILE__), '../', relative_path)
    else
      File.join(Dir.home, '.config/git-np', relative_path)
    end
  end

  def read_yaml(file_path)
    if File.exist?(file_path)
      YAML.safe_load(File.open(file_path))
    else
      {}
    end
  end
end
