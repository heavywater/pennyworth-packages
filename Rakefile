require 'bunchr'

Bunchr.build_dir   = '/tmp/build'
Bunchr.install_dir = '/opt/sensu'

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

  t.files << Bunchr.install_dir    # /opt/sensu
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

# default task executed when `rake` is run with no args.
task :default => ['packages:sensu']
