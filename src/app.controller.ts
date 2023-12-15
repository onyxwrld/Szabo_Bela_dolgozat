import { Body, Controller, Get, Post, Render, Res } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { kuponDTO } from './kuponDTO';
import e, {Response} from 'express';
const conn = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 3306,
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'database',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Render('index')
  async index() {
    const [ adatok ] = await conn.execute('SELECT id, title, percentage, code FROM szinhaz ORDER BY title');
    console.log(adatok);
    return {
      cupons: adatok, 
     };
  }
  @Get('/newCoupon')
  @Render('newCoupon')
  newMusic() {
    return { hiba: '' };
  }

  @Post('/newCoupon')
  @Render('newCoupon')
  async addNewMusic(@Body() newCoupon: kuponDTO, @Res() res: Response) {
      const title = newCoupon.title;
      const percentage = parseInt(newCoupon.percentage);
      const code = newCoupon.code;
      const regex: RegExp = /^[A-Z]{4}-\d{6}$/;
      console.log(percentage);
      if(title.trim() == "" || percentage.toString().trim() == "" || code.toString().trim() == "") {
        return { hiba: "Minden mezőt kötelező kitölteni!"};
      } else if(regex.test(code)!=true) 
      {
        return { hiba: "Nem megfelelő kód formátum!"};
      }
      else if(title.length<1) 
      {
        return { hiba: "Több karakteres cimet adjon meg!"};
      }
      else if(!(percentage<=99 && percentage>=1)) 
      {
        return { hiba: "Nem megfelelő százalék érték!"};
      }
      else
      {
        const [ adatok ] = await conn.execute('INSERT INTO szinhaz (title, percentage, code) VALUES (?, ?, ?)', [ 
          title,
          percentage,
          code,
        ],
        );
        res.redirect('/');
      }
    }
}
