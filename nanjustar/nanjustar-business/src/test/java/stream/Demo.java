package stream;

import org.junit.jupiter.api.Test;
import org.omg.CORBA.PUBLIC_MEMBER;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Demo {
    private static List<Person> personList = new ArrayList<Person>();

    static {
        personList.add(new Person("Tom", 8900, 28, "male", "New York"));
        personList.add(new Person("Jack", 7000, 18, "male", "Washington"));
        personList.add(new Person("Lily", 7800, 8, "female", "Washington"));
        personList.add(new Person("Anni", 8200, 38, "female", "New York"));
        personList.add(new Person("Owen", 9500, 48, "male", "New York"));
        personList.add(new Person("Alisa", 7900, 68, "female", "New York"));
    }

    @Test
    public void saveSalary() {

        List<Person> collect = personList.stream().map(person -> {
            person.setSalary(person.getSalary() + 1000);
            return person;
        }).collect(Collectors.toList());
        collect.forEach(System.out::println);
    }

    @Test
    public void getMaxSalary() {
        Optional<Person> max = personList.stream()
                .max(Comparator.comparingInt(Person::getSalary));

        System.out.println("最高薪资到人员信息  ==>  " + max.get());
    }

    @Test
    public void getSalary() {
        List<String> collect = personList.stream()
                .filter(x -> x.getSalary() > 8000)
                .map(Person::getName)
                .collect(Collectors.toList());
        System.out.println("高于8000薪资到人员信息  ==>  " + collect);
    }

    @Test
    public void foreach() {
        List<Integer> list = Arrays.asList(7, 6, 9, 3, 8, 2, 1);

        //便利符合条件的字符串
        list.stream().filter(x -> x > 6).forEach(System.out::println);

        //匹配到第一个
        Optional<Integer> first = list.stream().filter(x -> x > 6).findFirst();

        //匹配任意（适用于并行流）
        Optional<Integer> any = list.parallelStream().filter(x -> x > 6).findAny();

        //是否包含特殊条件元素
        boolean b = list.stream().anyMatch(x -> x > 6);

        System.out.println("匹配到第一个 ==> " + first.get());
        System.out.println("匹配任意（适用于并行流） ==> " + any.get());
        System.out.println("是否包含特殊条件元素 ==> " + b);
    }

    @Test
    public void testDemo() {
        List<Integer> list = Arrays.asList(6, 7, 3, 8, 1, 2, 9);
        Stream<Integer> stream = list.stream();
        stream.filter(x -> x > 7).forEach(System.out::println);
    }

    @Test
    public void listString() {
        List<String> list = Arrays.asList("adnm", "admmt", "pot", "xbangd", "weoujgsd");

        Optional<String> max = list.stream()
                .max(Comparator.comparing(String::length));
        System.out.println("最长的字符串 ==> " + max.get());
    }

    @Test
    public void listInteger() {
        List<Integer> list = Arrays.asList(7, 6, 9, 4, 11, 6);

        Optional<Integer> max = list.stream().max(Integer::compareTo);

        Optional<Integer> max1 = list.stream().max(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o1.compareTo(o2);
            }
        });

        System.out.println("自然排序的最大值 ==> " + max.get());
        System.out.println("自定义排序的最大值 ==> " + max1.get());
    }

    @Test
    public void listIntegerCount() {
        List<Integer> list = Arrays.asList(7, 6, 9, 4, 11, 6);
        long count = list.stream().filter(x -> x > 6).count();

        System.out.println("list中大于6的元素个数 ==> " + count);
    }

    @Test
    public void map() {
        String[] strArr = {"abcd", "bcdd", "defde", "fTr"};
        List<Integer> intList = Arrays.asList(1, 3, 5, 7, 9, 11);

        List<String> collect = Arrays.stream(strArr).map(String::toUpperCase).collect(Collectors.toList());
        List<Integer> collect1 = intList.stream().map(x -> x + 3).collect(Collectors.toList());

        System.out.println("每个元素大写：" + collect);
        System.out.println("每个元素+3：" + collect1);
    }

    @Test
    public void str() {
        List<String> list = Arrays.asList("m,k,l,a", "1,3,5,7");

        List<String> collect = list.stream().flatMap(s -> {
            String[] split = s.split(",");
            Stream<String> stream = Arrays.stream(split);
            return stream;
        }).collect(Collectors.toList());

        System.out.println("处理前的集合：" + list);
        System.out.println("处理后的集合：" + collect);
    }
}
