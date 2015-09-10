require 'gtk3'


class SimpleCalc < Gtk::Window

  def initialize
    super

    set_title "Calculator"
    signal_connect "destroy" do 
      Gtk.main_quit 
    end

    init_ui

    set_default_size 250, 250
    set_window_position(:center)

    show_all
  end

  def label(text)
    label = Gtk::Label.new text
    label.set_alignment(xalign = 1, yalign = 1)
    label.set_padding(xpad = 10, ypad = 10)
    label.set_markup("<span size=\"xx-large\">#{text}</span>")
  end

  def init_ui

    vbox = Gtk::Box.new(:vertical, 2)

    grid = Gtk::Grid.new
    grid.set_property "row-homogeneous", true
    grid.set_property "column-homogeneous", true

    grid.attach Gtk::Button.new(:label => "7"), 0, 1, 1, 1
    grid.attach Gtk::Button.new(:label => "8"), 1, 1, 1, 1
    grid.attach Gtk::Button.new(:label => "9"), 2, 1, 1, 1
    grid.attach Gtk::Button.new(:label => "/"), 3, 1, 1, 1

    grid.attach Gtk::Button.new(:label => "4"), 0, 2, 1, 1
    grid.attach Gtk::Button.new(:label => "5"), 1, 2, 1, 1
    grid.attach Gtk::Button.new(:label => "6"), 2, 2, 1, 1
    grid.attach Gtk::Button.new(:label => "*"), 3, 2, 1, 1

    grid.attach Gtk::Button.new(:label => "1"), 0, 3, 1, 1
    grid.attach Gtk::Button.new(:label => "2"), 1, 3, 1, 1
    grid.attach Gtk::Button.new(:label => "3"), 2, 3, 1, 1
    grid.attach Gtk::Button.new(:label => "-"), 3, 3, 1, 1

    grid.attach Gtk::Button.new(:label => "0"), 0, 4, 1, 1
    grid.attach Gtk::Button.new(:label => "."), 1, 4, 1, 1
    grid.attach Gtk::Button.new(:label => "="), 2, 4, 1, 1
    grid.attach Gtk::Button.new(:label => "+"), 3, 4, 1, 1

    vbox.pack_start(label('0'), :expand => false, :fill => false, :padding => 0)

    vbox.pack_end(grid, :expand => true, :fill => true, :padding => 0)

    add vbox

  end
end

Gtk.init
    window = SimpleCalc.new
Gtk.main