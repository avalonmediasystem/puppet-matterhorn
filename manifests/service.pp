class matterhorn::service {

  service { 'matterhorn':
    name       => 'matterhorn',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => [File['/opt/matterhorn/etc/config.properties'],File['/etc/rc.d/init.d/matterhorn']],
    require    => [Class['matterhorn::config']]
  }

}
