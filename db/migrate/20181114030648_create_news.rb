class CreateNews < ActiveRecord::Migration[5.2]
  def self.up
    create_table :news do |t|
      t.string :title, null:false, :limit=>255
      t.text :content
      t.string :image_path, :limit=>255
      t.column :post_type , "enum('news','event')", :default => 'news'
      t.string :author, :default => '1'
      t.string :slug, null:false
      t.integer :created_at, :null => false, :default => Time.now.to_i
      t.integer :updated_at, :null => false, :default => Time.now.to_i
    end
    add_index :news, :slug, unique:true
    # populate the table
    execute "INSERT INTO news (`title`,`content`,`post_type`,`slug`) VALUES ('J&T Express Hadirkan Layanan Pengiriman J&T Same Day Bagi Pelanggan','Jakarta, 17 September 2018 – J&T Express, perusahaan jasa','news','j&t-express-hadirkan-layanan-pengiriman-j&t-same-day-bagi-pelanggan')"
    execute "INSERT INTO news (`title`,`content`,`post_type`,`slug`) VALUES ('J&T Express Adakan Silahturami Dengan Penjual Online di Jabodetabek','Jakarta, 6 November 2018 – Sebagai jasa pengiriman','news','j&t-express-adakan-silahturahmi-dengan-penjual-online-di-jabodetabek')"
    execute "INSERT INTO news (`title`,`content`,`post_type`,`slug`) VALUES ('Keterbatasan Yang Memotivasi Untuk Berprestasi','Agus Prasetyo yang saat ini tengah berprofesi sebagai sprinter','event','keterbatasan-yang-memotivasi-untuk-berprestasi')"

  end

  def self.down
    drop_table :news
  end
end
