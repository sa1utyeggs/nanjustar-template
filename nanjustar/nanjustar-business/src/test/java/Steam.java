import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Steam {


    @Test
    public void collec() {
        List<String> list = Arrays.asList("a", "b", "c");
        //创建一个顺序流
        Stream<String> stream = list.stream();
        //创建一个并行流
        Stream<String> stringStream = list.parallelStream();
        System.out.println(stream);
        System.out.println(stringStream);
    }

    @Test
    public void array() {
        int[] arra = {1, 3, 5, 6, 8};
        IntStream stream = Arrays.stream(arra);
    }

    @Test
    public void test(){
        Stream<Integer> stream = Stream.of(1, 2, 3, 4, 5, 6);

        Stream<Integer> limit = Stream.iterate(0, (x) -> x + 3).limit(4);
        limit.forEach(System.out::println);

        Stream<Double> limit1 = Stream.generate(Math::random).limit(3);
        limit1.forEach(System.out::println);
    }

}
