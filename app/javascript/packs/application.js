//= require jquery3

//= require popper

//= require bootstrap

//= require rails-ujs

//= require turbolinks

//= require_tree .
require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import "bootstrap"
import "../stylesheets/application"

console.log('hello')
