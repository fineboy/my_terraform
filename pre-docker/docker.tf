provider "docker" {
  host = "tcp://ec2-52-213-169-66.eu-west-1.compute.amazonaws.com:2375/"
}
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}
resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
    external = 80
  }
#  volumes {
#    container_path  = "/usr/share/nginx/html"
#    host_path = "/home/scrapbook/tutorial/www"
#    read_only = true
#  }
}
