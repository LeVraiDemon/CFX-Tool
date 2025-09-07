import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext
import os
import subprocess
import shutil
import threading
from datetime import datetime

class CFXTool:
    def __init__(self, root):
        self.root = root
        self.root.title("CFX Tool")
        self.root.geometry("700x600")
        self.root.resizable(False, False)
        self.root.configure(bg='#2c3e50')
        
        # Style moderne
        self.setup_styles()
        
        # Interface principale
        self.create_main_interface()
        
        # Variables
        self.local_app_data = os.path.expandvars('%LOCALAPPDATA%')
        
    def setup_styles(self):
        """Configuration des styles modernes"""
        style = ttk.Style()
        
        # Style pour les boutons
        style.configure('Launch.TButton',
                       font=('Segoe UI', 10),
                       padding=(15, 10))
        
        style.configure('Cache.TButton',
                       font=('Segoe UI', 10),
                       padding=(15, 10))
        
        style.configure('Clear.TButton',
                       font=('Segoe UI', 10),
                       padding=(15, 10))
        
        # Style pour les labels
        style.configure('Title.TLabel',
                       font=('Segoe UI', 20, 'bold'),
                       background='#2c3e50',
                       foreground='white')
        
        style.configure('Subtitle.TLabel',
                       font=('Segoe UI', 12),
                       background='#2c3e50',
                       foreground='white')
    
    def create_main_interface(self):
        """Création de l'interface principale"""
        
        # Titre principal
        title_frame = tk.Frame(self.root, bg='#2c3e50')
        title_frame.pack(pady=20)
        
        title_label = ttk.Label(title_frame, 
                               text="CFX Tool",
                               style='Title.TLabel')
        title_label.pack()
        
        subtitle_label = ttk.Label(title_frame,
                                  text="Outil de gestion CFX RedM & FiveM",
                                  style='Subtitle.TLabel')
        subtitle_label.pack(pady=5)
        
        # Frame principal avec fond bleu console
        main_frame = tk.Frame(self.root, bg='#2c3e50', relief='raised', bd=2)
        main_frame.pack(padx=30, pady=20, fill='both', expand=True)
        
        # Grille de boutons
        buttons_frame = tk.Frame(main_frame, bg='#2c3e50')
        buttons_frame.pack(pady=15, fill='x')
        
        # Configurer la redimensionnabilité des colonnes
        buttons_frame.grid_columnconfigure(0, weight=1)
        buttons_frame.grid_columnconfigure(1, weight=1)
        
        # Boutons de lancement
        launch_frame = tk.LabelFrame(buttons_frame, text="Lancement", 
                                   font=('Segoe UI', 10, 'bold'), bg='#2c3e50', fg='#ecf0f1')
        launch_frame.grid(row=0, column=0, columnspan=2, pady=5, padx=10, sticky='ew')
        
        self.create_button(launch_frame, "Lancer RedM", self.launch_redm, 
                          bg='#f44336', fg='#333333', row=0, col=0)
        self.create_button(launch_frame, "Lancer FiveM", self.launch_fivem, 
                          bg="#F87800", fg='#333333', row=0, col=1)
        
        # Boutons de cache
        cache_frame = tk.LabelFrame(buttons_frame, text="Nettoyage Cache", 
                                  font=('Segoe UI', 10, 'bold'), bg='#2c3e50', fg='#ecf0f1')
        cache_frame.grid(row=1, column=0, columnspan=2, pady=5, padx=10, sticky='ew')
        
        self.create_button(cache_frame, "Cache RedM", self.clear_redm_cache, 
                          bg="#27B6C9", fg='#333333', row=0, col=0)
        self.create_button(cache_frame, "Cache FiveM", self.clear_fivem_cache, 
                          bg='#27B6C9', fg='#333333', row=0, col=1)
        
        # Boutons de nettoyage complet
        clear_frame = tk.LabelFrame(buttons_frame, text="Nettoyage Complet", 
                                  font=('Segoe UI', 10, 'bold'), bg='#2c3e50', fg='#ecf0f1')
        clear_frame.grid(row=2, column=0, columnspan=2, pady=5, padx=10, sticky='ew')
        
        self.create_button(clear_frame, "Clear RedM Complet", self.clear_redm_all, 
                          bg='#f44336', fg='#333333', row=0, col=0)
        self.create_button(clear_frame, "Clear FiveM Complet", self.clear_fivem_all, 
                          bg='#F87800', fg='#333333', row=0, col=1)
        
        # Zone de status principal (console unique)
        status_frame = tk.LabelFrame(main_frame, text="Console", 
                                   font=('Segoe UI', 10, 'bold'), bg='#2c3e50', fg='#ecf0f1')
        status_frame.pack(fill='both', expand=True, padx=20, pady=(0, 15))
        
        self.status_text = scrolledtext.ScrolledText(status_frame, 
                                                   height=18,
                                                   font=('Consolas', 9),
                                                   bg='#2c3e50',
                                                   fg='#ecf0f1',
                                                   insertbackground='white',
                                                   wrap='word')
        self.status_text.pack(fill='both', expand=True, padx=5, pady=5)
        
        # Messages initiaux
        self.update_status("CFX Tool charge avec succes !")
        self.update_status("Choisissez une action dans le menu ci-dessus.")
        self.update_status(">>> INFO: Console active et fonctionnelle !")
    
    def create_button(self, parent, text, command, bg, fg, row, col):
        """Création d'un bouton stylisé"""
        btn = tk.Button(parent, 
                       text=text,
                       command=command,
                       font=('Segoe UI', 10),
                       bg=bg, 
                       fg=fg,
                       relief='raised',
                       bd=2,
                       padx=15,
                       pady=10,
                       cursor='hand2')
        
        btn.grid(row=row, column=col, padx=8, pady=8, sticky='ew')
        parent.grid_columnconfigure(col, weight=1)
        
        # Effet hover léger (sans grossissement)
        def on_enter(e):
            btn.configure(bg=self.lighten_color(bg))
        
        def on_leave(e):
            btn.configure(bg=bg)
        
        btn.bind("<Enter>", on_enter)
        btn.bind("<Leave>", on_leave)
        
        return btn
    
    def lighten_color(self, color):
        """Éclaircit légèrement une couleur pour l'effet hover"""
        color_map = {
            '#f44336': '#ff5722',  # Rouge plus clair
            '#F87800': '#ff9800',  # Orange plus clair
            '#27B6C9': '#4fc3f7'   # Bleu plus clair
        }
        return color_map.get(color, color)
    
    def update_status(self, message):
        """Mise à jour du status avec timestamp et couleurs"""
        timestamp = datetime.now().strftime("%H:%M:%S")
        formatted_message = f"[{timestamp}] {message}\n"
        
        # Insérer le message
        self.status_text.insert(tk.END, formatted_message)
        
        # Obtenir la position de la ligne qui vient d'être ajoutée
        last_line = int(self.status_text.index(tk.END).split('.')[0]) - 2
        line_start = f"{last_line}.0"
        line_end = f"{last_line}.end"
        
        # Déterminer la couleur selon le contenu du message
        tag_name = None
        if any(keyword in message for keyword in [">>> SUCCES:", "✓", "lance avec succes", "nettoye completement", "supprimes avec succes", "effacees", "TERMINE ==="]):
            tag_name = "success"
        elif ">>> ERREUR:" in message:
            tag_name = "error"
        elif any(keyword in message for keyword in [">>> INFO:", ">>> ANNULE:", "Dossier inexistant", "Aucun cache", "Aucune donnee"]):
            tag_name = "info"
        
        # Appliquer la couleur si une balise a été déterminée
        if tag_name:
            self.status_text.tag_add(tag_name, line_start, line_end)
            if tag_name == "success":
                self.status_text.tag_config("success", foreground="#27ae60", font=('Consolas', 10, 'bold'))
            elif tag_name == "error":
                self.status_text.tag_config("error", foreground="#e74c3c", font=('Consolas', 10, 'bold'))
            elif tag_name == "info":
                self.status_text.tag_config("info", foreground="#f39c12", font=('Consolas', 10, 'bold'))
        
        # Scroller automatiquement vers le bas
        self.status_text.see(tk.END)
        self.root.update_idletasks()
        self.root.update()
    
    def run_in_thread(self, func):
        """Exécuter une fonction dans un thread séparé"""
        thread = threading.Thread(target=func)
        thread.daemon = True
        thread.start()
    
    def launch_redm(self):
        """Lancer RedM"""
        def launch():
            self.update_status("Lancement de RedM...")
            redm_path = os.path.join(self.local_app_data, "RedM", "RedM.exe")
            
            if os.path.exists(redm_path):
                try:
                    subprocess.Popen([redm_path])
                    self.update_status(">>> SUCCES: RedM lance avec succes !")
                    self.update_status(">>> RedM est maintenant en cours d'execution")
                except Exception as e:
                    self.update_status(f">>> ERREUR: Lancement de RedM echoue - {str(e)}")
            else:
                self.update_status(">>> ERREUR: RedM.exe non trouve. Verifiez l'installation.")
        
        self.run_in_thread(launch)
    
    def launch_fivem(self):
        """Lancer FiveM"""
        def launch():
            self.update_status("Lancement de FiveM...")
            fivem_path = os.path.join(self.local_app_data, "FiveM", "FiveM.exe")
            
            if os.path.exists(fivem_path):
                try:
                    subprocess.Popen([fivem_path])
                    self.update_status(">>> SUCCES: FiveM lance avec succes !")
                    self.update_status(">>> FiveM est maintenant en cours d'execution")
                except Exception as e:
                    self.update_status(f">>> ERREUR: Lancement de FiveM echoue - {str(e)}")
            else:
                self.update_status(">>> ERREUR: FiveM.exe non trouve. Verifiez l'installation.")
        
        self.run_in_thread(launch)
    
    def clear_redm_cache(self):
        """Nettoyer le cache RedM"""
        def clear():
            self.update_status("Debut nettoyage cache RedM...")
            
            redm_data_path = os.path.join(self.local_app_data, "RedM", "RedM.app", "data")
            
            cache_folders = [
                os.path.join(redm_data_path, "cache"),
                os.path.join(redm_data_path, "server-cache"),
                os.path.join(redm_data_path, "server-cache-priv")
            ]
            
            deleted_count = 0
            for folder in cache_folders:
                if os.path.exists(folder):
                    try:
                        shutil.rmtree(folder)
                        self.update_status(f"- Supprime avec succes: {os.path.basename(folder)}")
                        deleted_count += 1
                    except Exception as e:
                        self.update_status(f"- ERREUR suppression {os.path.basename(folder)}: {str(e)}")
                else:
                    self.update_status(f"- Dossier inexistant: {os.path.basename(folder)}")
            
            if deleted_count > 0:
                self.update_status(f">>> SUCCES: Cache RedM nettoye completement !")
                self.update_status(f">>> {deleted_count} dossiers supprimes avec succes")
            else:
                self.update_status(">>> INFO: Aucun cache RedM a nettoyer")
        
        self.run_in_thread(clear)
    
    def clear_fivem_cache(self):
        """Nettoyer le cache FiveM"""
        def clear():
            self.update_status("Debut nettoyage cache FiveM...")
            
            fivem_data_path = os.path.join(self.local_app_data, "FiveM", "FiveM.app", "data")
            
            cache_folders = [
                os.path.join(fivem_data_path, "cache"),
                os.path.join(fivem_data_path, "server-cache"),
                os.path.join(fivem_data_path, "server-cache-priv")
            ]
            
            deleted_count = 0
            for folder in cache_folders:
                if os.path.exists(folder):
                    try:
                        shutil.rmtree(folder)
                        self.update_status(f"- Supprime avec succes: {os.path.basename(folder)}")
                        deleted_count += 1
                    except Exception as e:
                        self.update_status(f"- ERREUR suppression {os.path.basename(folder)}: {str(e)}")
                else:
                    self.update_status(f"- Dossier inexistant: {os.path.basename(folder)}")
            
            if deleted_count > 0:
                self.update_status(f">>> SUCCES: Cache FiveM nettoye completement !")
                self.update_status(f">>> {deleted_count} dossiers supprimes avec succes")
            else:
                self.update_status(">>> INFO: Aucun cache FiveM a nettoyer")
        
        self.run_in_thread(clear)
    
    def clear_redm_all(self):
        """Nettoyage complet RedM"""
        def clear():
            result = messagebox.askyesno("Confirmation", 
                                       "Etes-vous sur de vouloir supprimer TOUS les donnees RedM ?\n"
                                       "Cela inclut: crashes, data, logs")
            if not result:
                self.update_status(">>> ANNULE: Nettoyage complet RedM annule par l'utilisateur")
                return
                
            self.update_status("=== DEBUT NETTOYAGE COMPLET REDM ===")
            
            redm_app_path = os.path.join(self.local_app_data, "RedM", "RedM.app")
            
            folders_to_delete = [
                os.path.join(redm_app_path, "crashes"),
                os.path.join(redm_app_path, "data"),
                os.path.join(redm_app_path, "logs")
            ]
            
            deleted_count = 0
            for folder in folders_to_delete:
                if os.path.exists(folder):
                    try:
                        shutil.rmtree(folder)
                        self.update_status(f"✓ Supprime avec succes: {os.path.basename(folder)}")
                        deleted_count += 1
                    except Exception as e:
                        self.update_status(f">>> ERREUR suppression {os.path.basename(folder)}: {str(e)}")
                else:
                    self.update_status(f"- Dossier inexistant: {os.path.basename(folder)}")
            
            if deleted_count > 0:
                self.update_status(f">>> SUCCES: RedM completement nettoye !")
                self.update_status(f">>> {deleted_count} dossiers principaux supprimes")
                self.update_status(">>> Toutes les donnees RedM ont ete effacees")
                self.update_status("=== NETTOYAGE COMPLET REDM TERMINE ===")
            else:
                self.update_status(">>> INFO: Aucune donnee RedM a nettoyer")
        
        self.run_in_thread(clear)
    
    def clear_fivem_all(self):
        """Nettoyage complet FiveM"""
        def clear():
            result = messagebox.askyesno("Confirmation", 
                                       "Etes-vous sur de vouloir supprimer TOUS les donnees FiveM ?\n"
                                       "Cela inclut: data, logs, crashes")
            if not result:
                self.update_status(">>> ANNULE: Nettoyage complet FiveM annule par l'utilisateur")
                return
                
            self.update_status("=== DEBUT NETTOYAGE COMPLET FIVEM ===")
            
            fivem_app_path = os.path.join(self.local_app_data, "FiveM", "FiveM.app")
            
            folders_to_delete = [
                os.path.join(fivem_app_path, "data"),
                os.path.join(fivem_app_path, "logs"),
                os.path.join(fivem_app_path, "crashes")
            ]
            
            deleted_count = 0
            for folder in folders_to_delete:
                if os.path.exists(folder):
                    try:
                        shutil.rmtree(folder)
                        self.update_status(f"✓ Supprime avec succes: {os.path.basename(folder)}")
                        deleted_count += 1
                    except Exception as e:
                        self.update_status(f">>> ERREUR suppression {os.path.basename(folder)}: {str(e)}")
                else:
                    self.update_status(f"- Dossier inexistant: {os.path.basename(folder)}")
            
            if deleted_count > 0:
                self.update_status(f">>> SUCCES: FiveM completement nettoye !")
                self.update_status(f">>> {deleted_count} dossiers principaux supprimes")
                self.update_status(">>> Toutes les donnees FiveM ont ete effacees")
                self.update_status("=== NETTOYAGE COMPLET FIVEM TERMINE ===")
            else:
                self.update_status(">>> INFO: Aucune donnee FiveM a nettoyer")
        
        self.run_in_thread(clear)

def main():
    root = tk.Tk()
    app = CFXTool(root)
    root.mainloop()

if __name__ == "__main__":

    main()
