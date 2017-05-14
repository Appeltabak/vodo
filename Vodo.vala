// modules: gtk+-3.0
int main (string[] args) {
    Gtk.init (ref args);

    var window = new Gtk.Window();
    window.title = "Vala Todo";
    window.set_border_width(12);
    window.set_position(Gtk.WindowPosition.CENTER);
    window.set_default_size(370, 20);
    window.destroy.connect(Gtk.main_quit);

    var grid = new Gtk.Grid();
    grid.orientation = Gtk.Orientation.VERTICAL;
    window.add(grid);

    var entry = new Gtk.Entry();
    entry.caps_lock_warning = false;
    entry.set_placeholder_text("What needs to be done?");
    grid.add(entry);

    var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
    grid.add(box);

    entry.activate.connect(() => {
        var new_item_text = entry.get_buffer().get_text();

        if (new_item_text == "") {
            return;
        }

        var new_item = new Gtk.Label(new_item_text);
        box.pack_end(new_item);
        entry.set_buffer(new Gtk.EntryBuffer());
        window.show_all();
    });
    

    window.show_all();
    Gtk.main();
    return 0;
} 
