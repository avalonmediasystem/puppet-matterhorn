class matterhorn::install {

  package { 'opencast-matterhorn14':
    ensure  => present,
    require => [Class['nulrepo'],Class['avalon::ffmpeg']],
  }
}


