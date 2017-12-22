require_relative 'controllers/menu_controller'

# creates a new MenuController
menu = MenuController.new

# clears the command line
system "clear"
puts "Welcome to AddressBloc!"

# displays the main menu puts
menu.main_menu
