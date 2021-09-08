movies = {
    The_Phantom_Menace: 2.5,
    The_Clone_Wars: 3,
    The_Revenge_Of_The_Sith:  4,
    A_New_Hope:  3,
    Empire_Strike_Back: 3.5,
    Return_Of_The_Jedi:  3,
    The_Force_Awaken:  1,
    The_Last_Jedi: 2,
    Rise_Of_The_Skywalker:  0,
    All_Season_of_CloneWars:  5,
    Mandolorian_Season1:  4,
    Mandolorian_Season2:  4.5
  }
  
  puts "Write 'add' to add a movie and a rating to the list."
  puts "Write 'update' to update the rating of a movie in the list."
  puts "Write 'display' to show the list."
  puts "Write 'delete' to delete a movie from the list."
  choice = gets.chomp
  
  case choice
    when "add" 
      puts "Insert the name of the movie you want to add"
      title = gets.chomp
      if movies[title.upcase.tr(" ", "_").to_sym].nil? 
        puts "What is your ratings for that movies?"
        rating = gets.chomp.to_i
        movies[title] = rating
      else 
        puts "This movie title is already in the list. Please try another one."
        title = gets.chomp
        title.to_sym
        puts "What is your ratings for that movies?"
        rating = gets.chomp.to_i
        movies[title] = rating
      end
  
    when "update"
      puts "Insert the name of the movie that you want to update its rating"
      title = gets.chomp
        if movies[title.gsub(/\s+/, "_").to_sym].nil?
          puts "This movie is not in the list"
        else 
          puts "Please insert the new rating"
          rating = gets.chomp
          movies[title] = rating
        end
  
    when "display"
      movies.each {|movie, rating| puts "#{movie}: #{rating}"}
    when "delete"
      puts "What movie would you like to delete."
      movies.each {|movie, rating| puts "#{movie}"}
      title = gets.chomp
        if movies[title.gsub(/\s+/, "_").to_sym].nil?
          puts "This movie is not in the list"
        else 
          movies.delete(title.gsub(/\s+/, "_").to_sym)
          puts "Task Succeeded: - #{title} - has been removed"
          movies.each {|movie, rating| puts "#{movie}: #{rating}"}
        end
    else 
      puts "Incorrect Command, please use of the following: "
      puts "add : To add a movie and its rating"
      puts "update : To update the rating of a movie"
      puts "display : To display the list of movies"
      puts "delete : To delete a movie from the list"
      choice = gets.chomp
      # Ici j'aimerais ça être en mesure de reset le programme '
  end
