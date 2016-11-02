Feature: Ajouter un user
  In order to ...
  I want to ...
  So ...

  Scenario: On ajoute un utilisateur sans droits d'admin
    Given a file named "testbddu.txt" with:
    """
    user;admin
    """
    When j'execute `mediatec --bddf=testbddf.txt add_usr user newuser`

    Then the file "testbddu.txt" should contain exactly:
    """
    user;admin
    newuser;user
    """

  Scenario: On ajoute un utilisateur avec droits d'admin
    Given a file named "testbddu.txt" with:
    """
    user;admin
    """
    When j'execute `mediatec --bddf=testbddf.txt add_usr -a user newadmin`

    Then the file "testbddu.txt" should contain exactly:
    """
    user;admin
    newadmin;admin
    """
