require 'bunchr'


current_directory = File.dirname(__FILE__)
build_directory = File.expand_path(File.join(current_directory, "build"))
FileUtils.mkdir_p(build_directory)

Bunchr.build_dir   = build_directory
Bunchr.install_dir = '/opt/heavywater'

Bunchr.load_recipes Dir['recipes/**/*.rake']

Bunchr::Packages.new do |t|
  t.name = 'sensu'
  t.version = ENV['SENSU_VERSION'] || '0.9.5'
  t.iteration = ENV['BUILD_NUMBER'] || '1'

  t.category = 'Monitoring'
  t.license  = 'MIT License'
  t.vendor   = 'Sonian Inc.'
  t.url      = 'https://github.com/sonian/sensu'
  t.description = 'A monitoring framework that aims to be simple, malleable, and scalable. Publish/subscribe model.'

  case t.ohai.platform_family
  when 'debian'
    t.scripts[:after_install]  = 'pkg_scripts/deb/postinst'
    t.scripts[:before_remove]  = 'pkg_scripts/deb/prerm'
    t.scripts[:after_remove]   = 'pkg_scripts/deb/postrm'
  when 'rhel', 'fedora'
    t.scripts[:before_install] = 'pkg_scripts/rpm/pre'
    t.scripts[:after_install]  = 'pkg_scripts/rpm/post'
    t.scripts[:before_remove]  = 'pkg_scripts/rpm/preun'
  end

  t.include_software('ruby')
  t.include_software('sensu')
  t.include_software('sensu_dashboard')
  t.include_software('sensu_configs')
  t.include_software('sensu_bin_stubs')

  t.files << Bunchr.install_dir
  t.files << '/usr/share/sensu'
  t.files << '/var/log/sensu'

  t.files << '/etc/init.d/sensu-api'
  t.files << '/etc/init.d/sensu-client'
  t.files << '/etc/init.d/sensu-server'
  t.files << '/etc/init.d/sensu-dashboard'

  # need to enumerate config files for fpm
  # these are installed from recipe/sensu_configs.rake
  t.config_files << "/etc/sensu/handlers/default"
  t.config_files << "/etc/sensu/conf.d/client.json"
  t.config_files << "/etc/sensu/conf.d/checks.json"
  t.config_files << "/etc/sensu/conf.d/handlers.json"
  t.config_files << "/etc/sensu/config.json"

  t.config_files << '/etc/logrotate.d/sensu'
end

Bunchr::Packages.new do |t|
  t.name = 'heavywater-ruby'
  t.version = ENV['RUBY_VERSION'] || '1.9.3p125'
  t.iteration = ENV['BUILD_NUMBER'] || '0' # Should come from Jenkins
  t.category = "Languages"
  t.license = "Ruby License"
  t.vendor = 'Heavy Water operations'
  t.url = 'http://www.hw-ops.com'
  t.description = 'Ruby 1.9.3-p125 packaged by HW'

  case t.ohai.platform_family
  when 'debian'
    t.scripts[:after_install]  = 'pkg_scripts/deb/postinst'
  end

  t.include_software('ruby')
  t.files << Bunchr.install_dir
end

# default task executed when `rake` is run with no args.
task :default => ['packages:heavywater-ruby']
