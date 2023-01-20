require 'open3'

def menu
    puts "1. Afficher le contenu d'un répertoire"
    puts "2. Créer un nouveau répertoire"
    puts "3. Supprimer un répertoire"
    puts "4. Quitter"
    print "Entrez votre choix: "
end

while true do
    menu
    choice = gets.chomp
    case choice
    when '1'
        print "Entrez le chemin du répertoire: "
        path = gets.chomp
        command = "ls #{path}"
        stdout, stderr, status = Open3.capture3(command)
        if status.success?
            puts stdout
        else
            puts stderr
        end
    when '2'
        print "Entrez le chemin du nouveau répertoire: "
        path = gets.chomp
        command = "mkdir #{path}"
        stdout, stderr, status = Open3.capture3(command)
        if status.success?
            puts "Répertoire créé avec succès"
        else
            puts stderr
        end
    when '3'
        print "Entrez le chemin du répertoire à supprimer: "
        path = gets.chomp
        command = "rmdir #{path}"
        stdout, stderr, status = Open3.capture3(command)
        if status.success?
            puts "Répertoire supprimé avec succès"
        else
            puts stderr
        end
    when '4'
        break
    else
        puts "Choix non valide"
    end
end