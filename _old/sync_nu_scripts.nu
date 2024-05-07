#! /home/julius/.cargo/bin/nu

let target_folder = "/usr/bin/"
let script_folder = "nuscripts/"

let script_list = ls -f $script_folder | get name
$script_list | each { |script| cp $script $target_folder}
