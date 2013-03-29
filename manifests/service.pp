class matterhorn::service {

  service { 'matterhorn':
    name       => 'matterhorn',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => [File["${matterhorn::config::matterhorn_base}/etc/config.properties"],File['/etc/rc.d/init.d/matterhorn']],
    require    => [Class['matterhorn::config']]
  }

}
