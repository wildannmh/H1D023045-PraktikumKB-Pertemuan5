import tkinter as tk
from tkinter import ttk
from pyswip import Prolog
from tkinter import messagebox

prolog = Prolog()
prolog.consult("pakar_musik.pl")

genre = []
karakteristik = {}
index_genre = 0
index_karakteristik = 0
current_genre = ""
current_karakteristik = ""

def mulai_diagnosa():
    global genre, karakteristik, index_genre, index_karakteristik
    prolog.retractall("karakteristik_pos(_)")
    prolog.retractall("karakteristik_neg(_)")

    start_btn.configure(state=tk.DISABLED)
    yes_btn.configure(state=tk.NORMAL)
    no_btn.configure(state=tk.NORMAL)

    genre = [g["X"].decode() for g in list(prolog.query("genre(X)"))]
    karakteristik.clear()
    for g in genre:
        karakteristik[g] = [x["X"] for x in list(prolog.query(f"karakteristik(X, \"{g}\")"))]

    index_genre = 0
    index_karakteristik = -1
    pertanyaan_selanjutnya()

def pertanyaan_selanjutnya(ganti_genre=False):
    global current_genre, current_karakteristik, index_genre, index_karakteristik

    if ganti_genre:
        index_genre += 1
        index_karakteristik = -1

    if index_genre >= len(genre):
        hasil_rekomendasi()
        return

    current_genre = genre[index_genre]
    index_karakteristik += 1

    if index_karakteristik >= len(karakteristik[current_genre]):
        hasil_rekomendasi(current_genre)
        return

    current_karakteristik = karakteristik[current_genre][index_karakteristik]

    if list(prolog.query(f"karakteristik_pos({current_karakteristik})")):
        pertanyaan_selanjutnya()
        return
    elif list(prolog.query(f"karakteristik_neg({current_karakteristik})")):
        pertanyaan_selanjutnya(ganti_genre=True)
        return

    hasil = list(prolog.query(f"pertanyaan({current_karakteristik}, Y)"))
    if hasil:
        pertanyaan = hasil[0]["Y"].decode()
        tampilkan_pertanyaan(pertanyaan)
    else:
        tampilkan_pertanyaan("Pertanyaan tidak ditemukan.")

def tampilkan_pertanyaan(pertanyaan):
    kotak_pertanyaan.configure(state=tk.NORMAL)
    kotak_pertanyaan.delete(1.0, tk.END)
    kotak_pertanyaan.insert(tk.END, pertanyaan)
    kotak_pertanyaan.configure(state=tk.DISABLED)

def jawaban(jwb):
    if jwb:
        prolog.assertz(f"karakteristik_pos({current_karakteristik})")
        pertanyaan_selanjutnya()
    else:
        prolog.assertz(f"karakteristik_neg({current_karakteristik})")
        pertanyaan_selanjutnya(ganti_genre=True)

def hasil_rekomendasi(genre_yang_cocok=""):
    if genre_yang_cocok:
        messagebox.showinfo("Rekomendasi Genre Musik", f"Genre musik yang paling sesuai dengan preferensi Anda adalah: {genre_yang_cocok}.")
    else:
        messagebox.showinfo("Rekomendasi Genre Musik", "Maaf, kami tidak dapat menemukan genre musik yang sesuai dengan jawaban Anda.")

    yes_btn.configure(state=tk.DISABLED)
    no_btn.configure(state=tk.DISABLED)
    start_btn.configure(state=tk.NORMAL)

root = tk.Tk()
root.title("Sistem Pakar Rekomendasi Genre Musik")

mainframe = ttk.Frame(root, padding="3 3 12 12")
mainframe.grid(column=0, row=0, sticky=(tk.N, tk.W, tk.E, tk.S))
root.columnconfigure(0, weight=1)
root.rowconfigure(0, weight=1)

ttk.Label(mainframe, text="Sistem Pakar Rekomendasi Genre Musik", font=("Arial", 16)).grid(column=0, row=0, columnspan=3)
ttk.Label(mainframe, text="Pertanyaan:").grid(column=0, row=1)

kotak_pertanyaan = tk.Text(mainframe, height=4, width=40, state=tk.DISABLED, wrap=tk.WORD)
kotak_pertanyaan.grid(column=0, row=2, columnspan=3)

no_btn = ttk.Button(mainframe, text="Tidak", state=tk.DISABLED, command=lambda: jawaban(False))
no_btn.grid(column=1, row=3, sticky=(tk.W, tk.E))

yes_btn = ttk.Button(mainframe, text="Ya", state=tk.DISABLED, command=lambda: jawaban(True))
yes_btn.grid(column=2, row=3, sticky=(tk.W, tk.E))

start_btn = ttk.Button(mainframe, text="Ayo Temukan!", command=mulai_diagnosa)
start_btn.grid(column=1, row=4, columnspan=2, sticky=(tk.W, tk.E))

for widget in mainframe.winfo_children():
    widget.grid_configure(padx=5, pady=5)

root.mainloop()
