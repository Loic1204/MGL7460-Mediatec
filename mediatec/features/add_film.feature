Feature: Ajouter un film
  In order to ...
  I want to ...
  So ...

  Scenario: On ajoute un film
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    And a file named "testbddu.txt" with:
    """
    user;admin
    """
    When j'execute `mediatec --bddf=testbddf.txt add_film user NewFilm SuperWriter Not2016Please`

    Then the file "testbddf.txt" should contain exactly:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    NewFilm;SuperWriter;Not2016Please;;
    """
