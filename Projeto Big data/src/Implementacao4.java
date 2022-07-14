// package com.aap.bigdata;
//Descomenta a linha um e verifica se os imports estão corretos
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.IOException;

public class Implementacao4 {
    public static class MapperImplementacao4 extends org.apache.hadoop.mapreduce.Mapper<Object, Text, Text, IntWritable> {

        @Override
        public void map(Object key, Text valor, Context context) throws IOException, InterruptedException {
            String linha = valor.toString();
            String[] campos = linha.split(";");
            if(campos.length == 9){

                String ano = campos[2];
                int ocorrencia = 1;

                Text chaveMap = new Text(ano);
                IntWritable valorMap = new IntWritable(ocorrencia);

                context.write(chaveMap, valorMap);
            }
        }
    }

    public static class ReducerImplementacao4 extends org.apache.hadoop.mapreduce.Reducer<Text, IntWritable, Text, IntWritable> {
        private IntWritable maximoCrimes = new IntWritable(0);
        private Text maximoCrimesAno = new Text("");

        @Override
        public void reduce(Text chave, Iterable<IntWritable> valores, Context context) throws IOException, InterruptedException {
            int soma = 0;
            for (IntWritable val : valores){
                soma += val.get();
            }
            if (soma > maximoCrimes.get()){
                maximoCrimes.set(soma);
                maximoCrimesAno.set(chave);
            }
            IntWritable valorSaida = new IntWritable(soma);
            context.write(maximoCrimesAno, maximoCrimes);
        }
    }

    public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {

      String arquivoEntrada = // coloca aqui o local que ta o arquivo tipo "/home/Pasta/Ocorrenciascriminas...."
      String arquivoSaida = // coloca aqui o local tu quer que vá o resultadp "/home/pasta de saida

      
      if(args.length == 2){
        arquivoEntrada = args[0];
        arquivoSaida = args[0];
      }

        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "atividade4");

        job.setJarByClass(Implementacao4.class);
        job.setMapperClass(MapperImplementacao4.class);
        job.setReducerClass(ReducerImplementacao4.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);
        
        FileInputFormat.addInputPath(job, new Path(arquivoIn));
        FileOutputFormat.setOutputPath(job, new Path(arquivoOut));

        job.waitForCompletion(true);
    }
}

