package com.nanjustar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class NanjustarApplication {
    public static void main(String[] args) {
        SpringApplication.run(NanjustarApplication.class, args);
        System.out.println("    ～～～楠橘星启动成功～～～     \n" +
                " .-._             ,--.-,  ,-,--.  ,--.--------.   ,---.                   \n" +
                "/==/ \\  .-._     |==' -|,-.'-  _\\/==/,  -   , -\\.--.'  \\      .-.,.---.   \n" +
                "|==|, \\/ /, /    |==|- /==/_ ,_.'\\==\\.-.  - ,-./\\==\\-/\\ \\    /==/  `   \\  \n" +
                "|==|-  \\|  |   __|==|, \\==\\  \\    `--`\\==\\- \\   /==/-|_\\ |  |==|-, .=., | \n" +
                "|==| ,  | -|,--.-'\\=|- |\\==\\ -\\        \\==\\_ \\  \\==\\,   - \\ |==|   '='  / \n" +
                "|==| -   _ ||==|- |=/ ,|_\\==\\ ,\\       |==|- |  /==/ -   ,| |==|- ,   .'  \n" +
                "|==|  /\\ , ||==|. /=| -/==/\\/ _ |      |==|, | /==/-  /\\ - \\|==|_  . ,'.  \n" +
                "/==/, | |- |\\==\\, `-' /\\==\\ - , /      /==/ -/ \\==\\ _.\\=\\.-'/==/  /\\ ,  ) \n" +
                "`--`./  `--` `--`----'  `--`---'       `--`--`  `--`        `--`-`--`--'  \n");

    }
}
