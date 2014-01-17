node 'slave01.test.com' {
  include java
  include hadoop::cluster::slave
}

node 'master.test.com' {
  include java 
  include hadoop::cluster::master 
}

