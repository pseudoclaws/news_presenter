require 'rails_helper'

RSpec.describe ScanYandex, type: :class do
  it 'creates news from yandex feed' do
    stub_request(:get, "https://news.yandex.ru/index.rss").with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(status: 200, body: '<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
    <channel>
        <title>Яндекс.Новости: Главное</title>
        <link>https://news.yandex.ru/index.html?from=rss</link>
        <description>
      Первая в России служба автоматической обработки и систематизации новостей. Сообщения ведущих российских и мировых СМИ. Обновление в режиме реального времени 24 часа в сутки.
    </description>
        <image>
            <url>https://company.yandex.ru/i/50x23.gif</url>
            <link>https://news.yandex.ru/index.html?from=rss</link>
            <title>Яндекс.Новости: Главное</title>
        </image>
        <lastBuildDate>12 Sep 2017 21:13:34 +0300</lastBuildDate>
        <item>
            <title>МИД РФ выразил протест США в связи с ситуацией вокруг дипсобственности</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=rg.ru%2F2017%2F09%2F11%2Fmid-rf-vyrazil-protest-ssha-v-sviazi-s-situaciej-vokrug-dipsobstvennosti.html&amp;from=rss</link>
            <description>Заместитель главы МИД России Сергей Рябков выразил протест заместителю госсекретаря США Томасу Шэннону из-за закрытия американскими властями генерального консульства РФ в Сан-Франциско, а также в связи с нелегитимным захватом российской дипломатической собственности в этом городе и в Вашингтоне.</description>
            <pubDate>11 Sep 2017 20:59:00 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=rg.ru%2F2017%2F09%2F11%2Fmid-rf-vyrazil-protest-ssha-v-sviazi-s-situaciej-vokrug-dipsobstvennosti.html&amp;from=rss</guid>
        </item>
        <item>
            <title>Вандалы повредили купол и окно в медиацентре парка «Зарядье» в Москве</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=www.rbc.ru%2Frbcfreenews%2F59b6c41b9a794774764b0598&amp;from=rss</link>
            <description>Вандалы повредили конструкции стеклянного купола «Медиацентра» и зеленые насаждения в открывшемся на днях парке «Зарядье» в Москве.</description>
            <pubDate>11 Sep 2017 20:35:45 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=www.rbc.ru%2Frbcfreenews%2F59b6c41b9a794774764b0598&amp;from=rss</guid>
        </item>
        <item>
            <title>Посольство США прокомментировало слова Лаврова по работе дипмиссий</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fworld%2F20170911%2F1502464711.html&amp;from=rss</link>
            <description>Ранее в понедельник глава российского МИД Сергей Лавров заявил, что Москва приведет условия работы дипмиссий России в США и США в Российской Федерации к полному паритету.</description>
            <pubDate>11 Sep 2017 16:44:49 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fworld%2F20170911%2F1502464711.html&amp;from=rss</guid>
        </item>
        <item>
            <title>Свидетель рассказал об игре Улюкаева и Сечина в бильярд в Гоа</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fincidents%2F20170911%2F1502225862.html&amp;from=rss</link>
            <description>Свидетель по делу экс-главы МЭР Алексея Улюкаева со стороны гособвинения, корреспондент портала &amp;quot;Лайф&amp;quot; Александр Юнашев, дал показания в суде, рассказав о сделанной в рамках саммита БРИКС в Гоа видеозаписи игры в бильярд главы &amp;quot;Роснефти&amp;quot; Игоря Сечина, Улюкаева и руководителя ВТБ Андрея Костина.</description>
            <pubDate>11 Sep 2017 12:12:00 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fincidents%2F20170911%2F1502225862.html&amp;from=rss</guid>
        </item>
        <item>
            <title>«Газпром» увеличит транзит газа через Украину, заявили в Киеве</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502468239.html&amp;from=rss</link>
            <description>&amp;quot;Газпром&amp;quot; подал заявку на увеличение транзита газа через Украину до 315 миллионов кубометров в сутки, сообщили в &amp;quot;Нафтогазе&amp;quot;.</description>
            <pubDate>11 Sep 2017 17:10:38 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502468239.html&amp;from=rss</guid>
        </item>
        <item>
            <title>Путин и Меркель обсудили размещение миротворцев ООН в Донбассе</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fworld%2F20170911%2F1502740339.html&amp;from=rss</link>
            <description>Президент России Владимир Путин обсудил в телефонном разговоре с канцлером ФРГ Ангелой Меркель российский проект резолюции Совета безопасности ООН о миротворческой миссии организации в Донбассе.</description>
            <pubDate>11 Sep 2017 20:06:20 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fworld%2F20170911%2F1502740339.html&amp;from=rss</guid>
        </item>
        <item>
            <title>«АвтоВАЗ» объявил о начале производства Vesta SW и Vesta SW Cross</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502578714.html&amp;from=rss</link>
            <description>Ранее глава &amp;quot;АвтоВАЗа&amp;quot; Николя Мор заявил журналистам, что Lada Vesta SW будет стоить дороже автомобиля в кузове седан в базовой версии, а Vesta SW Cross в максимальной комплектации с мотором 1,8 литра обойдется покупателям в 800 тысяч рублей.</description>
            <pubDate>11 Sep 2017 18:29:11 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502578714.html&amp;from=rss</guid>
        </item>
        <item>
            <title>Москва намерена уравнять условия работы дипломатов России и США</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=russian.rt.com%2Fworld%2Farticle%2F428913-paritet-diplomaty-rossiya-ssha&amp;from=rss</link>
            <description>Москва намерена привести условия работы американских дипломатов в России к полному паритету с положением российских дипработников в США.</description>
            <pubDate>11 Sep 2017 20:50:52 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=russian.rt.com%2Fworld%2Farticle%2F428913-paritet-diplomaty-rossiya-ssha&amp;from=rss</guid>
        </item>
        <item>
            <title>Минтруд подготовил законопроект о повышении МРОТ</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502632754.html&amp;from=rss</link>
            <description>Минтруд подготовил законопроект о поэтапном повышении МРОТ до прожиточного минимума, документ будет внесен в Госдуму вместе с федеральным бюджетом на 2018-2020 годы, сообщил министр труда и социальной защиты России Максим Топилин.</description>
            <pubDate>11 Sep 2017 19:22:00 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502632754.html&amp;from=rss</guid>
        </item>
        <item>
            <title>СМИ сообщили о грядущей отставке 10 губернаторов</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=www.spbdnevnik.ru%2Fnews%2F2017-09-11%2Fsmi-soobshchili-o-gryadushchey-otstavke-10-gubernatorov%2F&amp;from=rss</link>
            <description>В ближайшее время в Кремле сообщат об отставке 10 губернаторов по итогам выборов, которые прошли 10 сентября, передает РБК со ссылкой на собственные источники.</description>
            <pubDate>11 Sep 2017 17:25:00 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=www.spbdnevnik.ru%2Fnews%2F2017-09-11%2Fsmi-soobshchili-o-gryadushchey-otstavke-10-gubernatorov%2F&amp;from=rss</guid>
        </item>
        <item>
            <title>ОКБ предсказало рост числа потенциальных банкротов среди россиян</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502280085.html&amp;from=rss</link>
            <description>Число потенциальных банкротов среди россиян продолжит расти, заявил РИА Новости заместитель гендиректора Объединенного Кредитного Бюро (ОКБ) Николай Мясников.</description>
            <pubDate>11 Sep 2017 14:18:31 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502280085.html&amp;from=rss</guid>
        </item>
        <item>
            <title>Мэр Саратова ушел в отставку из-за «вопросов» к организации выборов</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=www.rbc.ru%2Fpolitics%2F11%2F09%2F2017%2F59b658f89a794728916e9eb3&amp;from=rss</link>
            <description>Врио губернатора Саратовской области Валерий Радаев заявил об отставке мэра Саратова Валерия Сараева.</description>
            <pubDate>11 Sep 2017 13:10:01 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=www.rbc.ru%2Fpolitics%2F11%2F09%2F2017%2F59b658f89a794728916e9eb3&amp;from=rss</guid>
        </item>
        <item>
            <title>Сбербанк опроверг сообщения о переводе дебетовых карт в овердрафтные</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502234737.html&amp;from=rss</link>
            <description>В банке пояснили, что в мобильном приложении некоторые дебетовые карты всегда отображались как овердрафтные — это техническая необходимость для корректной работы с платежами и переводами.</description>
            <pubDate>11 Sep 2017 13:26:46 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Feconomy%2F20170911%2F1502234737.html&amp;from=rss</guid>
        </item>
        <item>
            <title>Алексей Учитель назвал «бандитизмом» поджог машины его адвоката</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=iz.ru%2F644403%2F2017-09-11%2Faleksei-uchitel-nazval-banditizmom-podzhog-mashiny-ego-advokata&amp;from=rss</link>
            <description>Режиссер Алексей Учитель прокомментировал ситуацию вокруг поджога автомобилей у офиса его адвокатов.</description>
            <pubDate>11 Sep 2017 19:08:49 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=iz.ru%2F644403%2F2017-09-11%2Faleksei-uchitel-nazval-banditizmom-podzhog-mashiny-ego-advokata&amp;from=rss</guid>
        </item>
        <item>
            <title>Ответ Улюкаева Сечину цитатой из «Ревизора» высмеяли в соцсетях</title>
            <link>https://news.yandex.ru/yandsearch?cl4url=nation-news.ru%2F301347-otvet-ulyukaeva-sechinu-citatoi-iz-revizora-vysmeyali-v-socsetyakh&amp;from=rss</link>
            <description>Экс-министр экономического развития России Алексей Улюкаев ответил главе компании &amp;quot;Роснефть&amp;quot; Игорю Сечину о &amp;quot;кретинизме&amp;quot; во время оглашения стенограммы их разговора во время передачи взятки цитатой из произведения Николая Гоголя &amp;quot;Ревизор&amp;quot;.</description>
            <pubDate>11 Sep 2017 15:19:45 +0300</pubDate>
            <guid>https://news.yandex.ru/yandsearch?cl4url=nation-news.ru%2F301347-otvet-ulyukaeva-sechinu-citatoi-iz-revizora-vysmeyali-v-socsetyakh&amp;from=rss</guid>
        </item>
    </channel>
</rss>', headers: {})
    expect { ScanYandex.new.call }.to change(PieceOfNews, :count).by(0)
  end
end