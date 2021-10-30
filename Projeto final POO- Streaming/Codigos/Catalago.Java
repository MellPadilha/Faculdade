

public class Catalogo {

    public static void  main (String[] args) {
        Serie s1 = new Serie("The big bang theory:", "Comedy", "Mark Cendrowski",12);
        s1.adicionar(new Filme("Pilot", "Comedy","Mark Cendrowski", 22));
        s1.adicionar(new Filme("The big Bran Hypothesis", "Comedy","Mark Cendrowski", 21));
        s1.adicionar(new Filme("The Fuzzyboots Corollary", "Comedy", "Mark Cendrowski", 22));
        s1.adicionar(new Filme("The Luminous Fish Effect", "Comedy", "Mark Cendrowski", 20));



        Show c1 = new Show("Diamonds World Tour: ", "Music show","Rihanna");
        c1.adicionar(new Filme("Diamonds", "Music show", "Rihanna",3));
        c1.adicionar(new Filme("Pour it up", "Music show", "Rihanna",2));
        c1.adicionar(new Filme("Jump", "Music show", "Rihanna",4));
        c1.adicionar(new Filme("Right Now", "Music show", "Rihanna",3));


        Filme p1 = new Filme("Percy Jackson", "Fantasia/aventura","Zeus", 190);


        p1.imprimir();
        s1.imprimir();
        c1.imprimir();
    }
}
