class GitNP
  def bootstrap
    # Read from yaml file
    # Store parsed opts
    parse_opts('config.yaml')

    # Read markdown template files
    @opts['file_templates'] = read_markdown_templates

    # Set options from CLI - choose License, when not using custom values etc.
  end

  private

  def parse_opts(env_file_name)
    user_opts     = read_yaml(fetch_absolute_path(env_file_name, type: :user))
    default_opts  = read_yaml(fetch_absolute_path(env_file_name, type: :default))

    @opts = default_opts.merge(user_opts)
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
      YAML.safe_load(File.open(file_name))
    else
      {}
    end
  end
end
