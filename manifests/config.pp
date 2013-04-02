class matterhorn::config (

  $matterhorn_user  = 'matterhorn',
  $matterhorn_base  = '/usr/local/matterhorn',
  $matterhorn_admin = 'library@northwestern.edu',
  $rtmp_dir         = '/var/avalon/rtmp_streams',
  $hls_dir          = '/var/avalon/hls_streams',
  $http_port        = '8080',

) {

  File { require => Class['matterhorn::install'], }
  
  #init script
  file { '/etc/rc.d/init.d/matterhorn':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    content => template("matterhorn/matterhorn_init.erb"),
  }
  #config.properties
  file { "$matterhorn_base/etc/config.properties":
    ensure  => present,
    content => template("matterhorn/config.properties.erb"),
    owner   => 'matterhorn',
    group   => 'matterhorn',
  }

}


