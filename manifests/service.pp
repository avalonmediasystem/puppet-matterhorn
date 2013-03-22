class matterhorn::service {

  service { 'matterhorn':
    name       => 'matterhorn',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => [Class['matterhorn::config']]
  }

}
