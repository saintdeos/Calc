require 'gtk3'
require 'byebug'


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

  def init_ui
    @buttons = []
    vbox = Gtk::Box.new(:vertical, 2)

    def button(label)
      @buttons << Gtk::Button.new(:label => "#{label}")
      @buttons.last
    end

    def label(text)
      @label = Gtk::Label.new text
      @label.set_alignment(xalign = 1, yalign = 1)
      @label.set_padding(xpad = 10, ypad = 10)
      # @label.set_attributes(:name => "font-desc", :value =>"Andale Mono Bold 20")
      # @label.set_markup("<span size=\"xx-large\">#{text}</span>")
    end

    grid = Gtk::Grid.new
    grid.set_property "row-homogeneous", true
    grid.set_property "column-homogeneous", true
# byebug
    grid.attach button('7'), 0, 1, 1, 1
    grid.attach button('8'), 1, 1, 1, 1
    grid.attach button('9'), 2, 1, 1, 1
    grid.attach button('/'), 3, 1, 1, 1

    grid.attach button('4'), 0, 2, 1, 1
    grid.attach button('5'), 1, 2, 1, 1
    grid.attach button('6'), 2, 2, 1, 1
    grid.attach button('*'), 3, 2, 1, 1

    grid.attach button('1'), 0, 3, 1, 1
    grid.attach button('2'), 1, 3, 1, 1
    grid.attach button('3'), 2, 3, 1, 1
    grid.attach button('-'), 3, 3, 1, 1

    grid.attach button('0'), 0, 4, 1, 1
    grid.attach button('.'), 1, 4, 1, 1
    grid.attach button('='), 2, 4, 1, 1
    grid.attach button('+'), 3, 4, 1, 1

    vbox.pack_start(label('0'), :expand => false, :fill => false, :padding => 0)
    vbox.pack_end(grid, :expand => true, :fill => true, :padding => 0)
# byebug
    @buttons.each do |but|
      but.signal_connect "clicked" do |sender|
        @label.text += sender.label
      end
    end
    add vbox
  end
end

Gtk.init
  window = SimpleCalc.new
Gtk.main
