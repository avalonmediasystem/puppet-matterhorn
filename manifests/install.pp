class matterhorn::install {

  package { 'opencast-matterhorn14':
    ensure  => present,
    require => [Class['nulrepo'],Class['avalon::ffmpeg']],
  }

  user { 'matterhorn':
    ensure     => present,
    require    => Package['opencast-matterhorn14']
  }

}


