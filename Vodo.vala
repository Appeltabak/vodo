// modules: gtk+-3.0

public class Vodo : Gtk.Application {
    Gtk.ApplicationWindow window;

    public Vodo() {
        Object(application_id: "com.github.appeltabak.vodo");
    }

    protected override void activate() {
        window = new Gtk.ApplicationWindow(this);
        window.title = "Vala Todo";
        window.set_border_width(12);
        window.set_position(Gtk.WindowPosition.CENTER);
        window.set_default_size(700, 500);

        var grid = new Gtk.Grid();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.expand = true;
        grid.set_halign(Gtk.Align.FILL);
        grid.set_valign(Gtk.Align.FILL);
        window.add(grid);

        var entry = new Gtk.Entry();
        entry.caps_lock_warning = false;
        entry.set_placeholder_text("What needs to be done?");
        entry.hexpand = true;
        grid.add(entry);

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        grid.add(box);

        entry.activate.connect(() => {
          var new_item_text = entry.get_buffer().get_text();

          if (new_item_text == "") {
            return;
          }

          var check_box = new Gtk.CheckButton();
          grid.add(check_box);
          check_box.toggled.connect(() => {

              if (check_box.active) {
                  return;
              }
          });

          var new_item = new Gtk.Label(new_item_text);
          box.pack_end(new_item);
          entry.set_buffer(new Gtk.EntryBuffer());
          window.show_all();
        });

        window.show_all();
    }
}


int main (string[] args) {
    return new Vodo().run(args);
}
