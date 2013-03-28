class matterhorn::config (

  $matterhorn_user  = 'matterhorn',
  $matterhorn_base  = '/opt/matterhorn',
  $matterhorn_admin = 'library@northwestern.edu',
  $rtmp_dir         = '/var/avalon/rtmp_streams',
  $hls_dir          = '/var/avalon/hls_streams',

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
  file { '/opt/matterhorn/etc/config.properties':
    ensure  => present,
    content => template("matterhorn/config.properties.erb"),
    owner   => 'matterhorn',
    group   => 'matterhorn',
  }

  file { ['/var/log/matterhorn','/var/matterhorn']:
    ensure  => directory,
    owner   => 'matterhorn',
    group   => 'matterhorn',
  }

  #Matterhorn/lib 
  file { "$matterhorn_base/lib/matterhorn":
    source  => "puppet:///local/matterhorn/lib/matterhorn",
    recurse => true,
    purge   => true,
    notify  => Service['matterhorn'],
  }

  #Matterhorn/etc/encoding

  file { "$matterhorn_base/etc/encoding/avalon.properties":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/etc/encoding/avalon.properties",
  }
  
  #Matterhorn/etc/workflows

  file { "$matterhorn_base/etc/workflows/avalon-audio.xml":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/etc/workflows/avalon-audio.xml",
  }
  
  file { "$matterhorn_base/etc/workflows/avalon-video.xml":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/etc/workflows/avalon-video.xml",
  }

}


