
public class Filme extends Item {
    protected int duracao;

    public int getDuracao (){
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public Filme (String titulo, String genero, String diretor, int duracao) {
        super(titulo, genero, diretor);
        this.duracao = duracao;
    }

    @Override
    public void imprimir () {
        System.out.println("Catalogo:"+ "\n");
        System.out.println(getTitulo() + ", (" + getGenero() + "). " + getDiretor() + " - " + getDuracao() + " min" + "\n");


    }

}

