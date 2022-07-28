import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
    const app = await NestFactory.create(AppModule);
    console.log(
        "NODE_ENV: ",
        process.env.NODE_ENV
    );
    await app.listen(
        process.env.APP_PORT
    );
}
bootstrap();
