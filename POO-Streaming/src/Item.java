
public abstract class Item {
    protected String titulo;
    protected String genero;
    protected String diretor;

    //construtor
    public Item(String titulo, String genero, String diretor) {
        this.titulo = titulo;
        this.genero = genero;
        this.diretor= diretor;
    }
    // get e set
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getDiretor() {
        return diretor;
    }

    public void setDiretor(String diretor) {
        this.diretor = diretor;
    }

    //outros metodos

    public abstract void imprimir();
}
