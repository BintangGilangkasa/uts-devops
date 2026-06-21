terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }
}

provider "docker" {}

#mengunduh image ubuntu terbaru
resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = false
}

#wadah komputer kosong sesuai instruksi
resource "docker_container" "server_uas_devops" {
  image = docker_image.ubuntu.image_id
  name  = "server_uas_devops"
  
  #menjaga kontainer tetap menyala
  tty   = true
  stdin_open = true
}