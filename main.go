package main

import (
	"html/template"
	"log"
	"net/http"
	"strconv"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Buku struct {
	ID       uint
	Judul    string
	Penulis  string
	Penerbit string
}

// Koneksi ke databases
func connectDB() (*gorm.DB, error) {
	dsn := "root:@tcp(localhost:3306)/perpustakaan?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		return nil, err
	}
	return db, nil
}

// Handler untuk halaman utama
func homeHandler(w http.ResponseWriter, r *http.Request) {
	db, err := connectDB()
	if err != nil {
		http.Error(w, "Gagal koneksi ke database", http.StatusInternalServerError)
		return
	}

	// mengambil data dari databases
	var bukus []Buku
	db.Find(&bukus)

	//memanggil template atau HTML
	tmpl := template.Must(template.ParseFiles("template/index.html"))
	tmpl.Execute(w, struct {
		Name  string
		Bukus []Buku
	}{
		Name:  "Daftar Buku Perpustakaan Lia",
		Bukus: bukus,
	})
}

// Cara menambahkan data di web
func editHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Redirect(w, r, "/", http.StatusSeeOther)
		return
	}

	//mengisi data
	id := r.FormValue("ID")
	judul := r.FormValue("Judul")
	penulis := r.FormValue("Penulis")
	penerbit := r.FormValue("Penerbit")

	db, err := connectDB()
	if err != nil {
		http.Error(w, "Gagal koneksi ke database", http.StatusInternalServerError)
		return
	}

	db.Model(&Buku{}).Where("id = ?", id).Updates(Buku{
		Judul:    judul,
		Penulis:  penulis,
		Penerbit: penerbit,
	})

	http.Redirect(w, r, "/", http.StatusSeeOther)
}

func tambahHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodPost {
		judul := r.FormValue("Judul")
		penulis := r.FormValue("Penulis")
		penerbit := r.FormValue("Penerbit")

		db, err := connectDB()
		if err != nil {
			http.Error(w, "Gagal koneksi ke database", http.StatusInternalServerError)
			return
		}

		db.Create(&Buku{Judul: judul, Penulis: penulis, Penerbit: penerbit})
	}

	http.Redirect(w, r, "/", http.StatusSeeOther)
}

func hapusHandler(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	uid, _ := strconv.Atoi(id)

	db, err := connectDB()
	if err != nil {
		http.Error(w, "Gagal koneksi ke database", http.StatusInternalServerError)
		return
	}

	db.Delete(&Buku{}, uid)

	http.Redirect(w, r, "/", http.StatusSeeOther)
}

func main() {
	http.HandleFunc("/", homeHandler)
	http.HandleFunc("/edit", editHandler)
	http.HandleFunc("/tambah", tambahHandler)
	http.HandleFunc("/hapus", hapusHandler)

	log.Println("Server berjalan di :8080")
	http.ListenAndServe(":8080", nil)
}
