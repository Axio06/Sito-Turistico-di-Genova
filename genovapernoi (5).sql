-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 02, 2025 alle 22:47
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `genovapernoi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisti`
--

CREATE TABLE `acquisti` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `itinerario_id` int(11) NOT NULL,
  `data_acquisto` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `acquisti`
--

INSERT INTO `acquisti` (`id`, `user_id`, `itinerario_id`, `data_acquisto`) VALUES
(3, 8, 1, '2025-06-02 21:00:54');

-- --------------------------------------------------------

--
-- Struttura della tabella `biglietto`
--

CREATE TABLE `biglietto` (
  `ID` int(11) NOT NULL,
  `dataAcquisto` date DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `IDUtente` int(11) DEFAULT NULL,
  `IDTariffa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `biglietto`
--

INSERT INTO `biglietto` (`ID`, `dataAcquisto`, `password`, `IDUtente`, `IDTariffa`) VALUES
(1, '2025-05-26', 'passbiglietto1', 1, 1),
(2, '2025-05-27', 'passbiglietto2', 2, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrizione` text NOT NULL,
  `percorso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `immagini`
--

INSERT INTO `immagini` (`id`, `nome`, `descrizione`, `percorso`) VALUES
(1, 'acquario.jpg', 'Description for Acquario', 'img/acquario.jpg'),
(2, 'anita_garibaldi.jpg', 'Description for Anita Garibaldi', 'img/anita_garibaldi.jpg'),
(3, 'anteprima.jpg', 'Description for Anteprima', 'img/anteprima.jpg'),
(4, 'bachernia.jpg', 'Description for Bachernia', 'img/bachernia.jpg'),
(5, 'balbi.jpg', 'Description for Balbi', 'img/balbi.jpg'),
(6, 'bianco.jpg', 'Description for Bianco', 'img/bianco.jpg'),
(7, 'carrega.jpg', 'Description for Carrega', 'img/carrega.jpg'),
(8, 'centro.jpg', 'Description for Centro', 'img/centro.jpg'),
(9, 'centrostorico.jpg', 'Description for Centro Storico', 'img/centrostorico.jpg'),
(10, 'colombo.jpg', 'Description for Colombo', 'img/colombo.jpg'),
(11, 'fortesperone.jpg', 'Description for Forte Sperone', 'img/fortesperone.jpg'),
(12, 'gam_nervi.jpg', 'Description for GAM Nervi', 'img/gam_nervi.jpg'),
(13, 'genova_header.jpg', 'Description for Genova Header', 'img/genova_header.jpg'),
(14, 'intro_genova.jpg', 'Description for Intro Genova', 'img/intro_genova.jpg'),
(15, 'intro_genova_dall_alto.jpg', 'Description for Intro Genova Dall Alto', 'img/intro_genova_dall_alto.jpg'),
(16, 'intro_nervi.jpg', 'Description for Intro Nervi', 'img/intro_nervi.jpg'),
(17, 'itinerario_nervi.jpg', 'Description for Itinerario Nervi', 'img/itinerario_nervi.jpg'),
(18, 'lomellino.jpg', 'Description for Lomellino', 'img/lomellino.jpg'),
(19, 'meridiana.jpg', 'Description for Meridiana', 'img/meridiana.jpg'),
(20, 'osservatorio.jpg', 'Description for Osservatorio', 'img/osservatorio.jpg'),
(21, 'palazzo_ducale.jpg', 'Description for Palazzo Ducale', 'img/palazzo_ducale.jpg'),
(22, 'palazzo_san_giorgio.jpg', 'Description for Palazzo San Giorgio', 'img/palazzo_san_giorgio.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `informazioni`
--

CREATE TABLE `informazioni` (
  `ID` int(11) NOT NULL,
  `foto` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `tipoPagina` varchar(10) DEFAULT NULL CHECK (`tipoPagina` in ('base','avanzata')),
  `lingua` varchar(30) DEFAULT NULL,
  `IDPOI` int(11) DEFAULT NULL,
  `IDTariffa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `informazioni`
--

INSERT INTO `informazioni` (`ID`, `foto`, `video`, `tipoPagina`, `lingua`, `IDPOI`, `IDTariffa`) VALUES
(1, 'fontana.jpg', 'fontana.mp4', 'base', 'italiano', 1, 1),
(2, 'palazzorosso.jpg', NULL, 'avanzata', 'italiano', 2, 2),
(3, 'sentieroverde.jpg', NULL, 'base', 'italiano', 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `interesse`
--

CREATE TABLE `interesse` (
  `ID` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `interesse`
--

INSERT INTO `interesse` (`ID`, `nome`, `descrizione`) VALUES
(1, 'Arte', 'Interesse per musei, monumenti e gallerie d\'arte'),
(2, 'Cucina', 'Interesse per cibo e ristoranti tipici'),
(3, 'Natura', 'Interesse per escursioni, parchi e natura');

-- --------------------------------------------------------

--
-- Struttura della tabella `itinerario`
--

CREATE TABLE `itinerario` (
  `ID` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `durata` int(11) DEFAULT NULL,
  `difficolta` varchar(20) DEFAULT NULL,
  `descrizione` text DEFAULT NULL,
  `immagine` varchar(255) NOT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `itinerario`
--

INSERT INTO `itinerario` (`ID`, `nome`, `durata`, `difficolta`, `descrizione`, `immagine`, `prezzo`) VALUES
(1, 'Itinerario Centro Storico', 3, 'facile', 'Tour a piedi nel centro storico di Genova', 'img/centrostorico.jpg', 5.99),
(2, 'Palazzi dei Rolli', 3, 'Facile', 'Un itinerario culturale tra i palazzi storici di Genova,patrimonio UNESCO.', 'img/rolli_itinerario.jpg', 4.99),
(4, 'Passeggiata panoramica sopra Genova', 0, 'Facile', 'Questo itinerario panoramico conduce alla scoperta dei punti più suggestivi e affascinanti della collina genovese, dove natura, storia e scorci spettacolari si fondono in un’esperienza unica. Dal Belvedere Bachernia ai forti, passando per avventure tra gli alberi e osservazioni astronomiche, è il percorso perfetto per chi vuole vivere Genova dall’alto, respirare aria buona e scoprire luoghi spesso poco conosciuti ma carichi di fascino.', 'img/panoramica.jpg', 10.99),
(5, 'Passeggiata vista mare a Genova Nervi', 0, 'Facile', 'Una rilassante passeggiata panoramica tra i parchi, i musei e la famosa passeggiata a picco sul mare del quartiere Nervi. Ideale per chi desidera unire natura, cultura e splendidi affacci sul Mar Ligure.', 'img/itinerario_nervi.jpg', 1.99),
(6, 'Sulle tracce della Resistenza ', 0, 'Media', 'Questo itinerario storico ripercorre i luoghi simbolici della Resistenza partigiana a Genova. Una camminata urbana per ricordare i valori di libertà, coraggio e sacrificio attraverso strade, piazze e monumenti legati alla lotta contro l’occupazione nazifascista durante la Seconda Guerra Mondiale.', 'img/resistenza.jpg', 2.99);

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue`
--

CREATE TABLE `lingue` (
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lingue`
--

INSERT INTO `lingue` (`nome`) VALUES
('francese'),
('inglese'),
('italiano'),
('spagnolo');

-- --------------------------------------------------------

--
-- Struttura della tabella `poi`
--

CREATE TABLE `poi` (
  `ID` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `citta` varchar(50) DEFAULT NULL,
  `via` varchar(100) DEFAULT NULL,
  `descrizione` text DEFAULT NULL,
  `longitudine` float DEFAULT NULL,
  `latitudine` float DEFAULT NULL,
  `lingua_id` varchar(30) DEFAULT NULL,
  `tappa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `poi`
--

INSERT INTO `poi` (`ID`, `nome`, `citta`, `via`, `descrizione`, `longitudine`, `latitudine`, `lingua_id`, `tappa_id`) VALUES
(1, 'Fontana di Piazza De Ferrari', 'Genova', 'Piazza De Ferrari', 'Fontana storica nel centro della piazza', 8.9343, 44.406, 'italiano', 1),
(2, 'Palazzo Rosso', 'Genova', 'Via Garibaldi', 'Museo d\'arte con collezioni storiche', 8.9291, 44.4095, 'italiano', 2),
(3, 'Sentiero Verde', 'Genova', 'Parco Naturale', 'Sentiero naturalistico con vista panoramica', 8.9412, 44.4113, 'italiano', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `tappa`
--

CREATE TABLE `tappa` (
  `ID` int(11) NOT NULL,
  `IDItinerario` int(11) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `descrizione` text NOT NULL,
  `immagine` varchar(255) NOT NULL,
  `link_maps` varchar(255) DEFAULT NULL,
  `iframe_maps` text DEFAULT NULL,
  `tempoStimato` varchar(50) DEFAULT NULL,
  `ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tappa`
--

INSERT INTO `tappa` (`ID`, `IDItinerario`, `titolo`, `descrizione`, `immagine`, `link_maps`, `iframe_maps`, `tempoStimato`, `ordine`) VALUES
(17, 2, 'Introduzione ai Palazzi dei Rolli', 'I Palazzi dei Rolli di Genova sono dimore nobiliari storiche dichiarate Patrimonio dell’Umanità dall’UNESCO. Un tempo utilizzati per ospitare personalità in visita alla Repubblica di Genova, questi edifici rappresentano uno degli esempi più straordinari di architettura rinascimentale e barocca. L’itinerario permette di esplorare la magnificenza dei palazzi attraverso un percorso culturale unico.Dal 2006, UNESCO riconosce gli splendidi palazzi rinascimentali e barocchi dell’aristocrazia di Genova come Patrimonio Mondiale dell’Umanità, con il nome ufficiale “Le Strade Nuove e il sistema dei Palazzi del Rolli”.\n\nIl sito UNESCO comprende 42 palazzi, fra gli oltre 100 ancora esistenti attraverso tutto il centro storico della città. In molti casi i palazzi sono di proprietà privata, sedi di aziende e uffici, o tuttora abitati da nobili famiglie. Ma molti Palazzi dei Rolli sono visitabili tutto l’anno.\n\nPossiamo ammirare in qualsiasi momento i palazzi che sono diventati Musei: i tre palazzi che compongono i Musei di Strada Nuova, la Galleria Nazionale di Palazzo Spinola di Pellicceria, il Museo di Palazzo Reale; altri sono sedi di enti e istituzioni che permettono di visitarli almeno in parte; alcuni palazzi, di proprietà privata, ospitano mostre e iniziative culturali. Inoltre, passeggiando per il centro storico si possono ammirare spesso gli atrii e i cortili decorati di molti palazzi.\n\nConsulta le schede qui sotto per scoprire orari e modalità di visita dei Palazzi dei Rolli sempre aperti, e consulta la mappa per orientarti nel centro storico!\n\nI Rolli Days\nL\'appuntamento più atteso: un weekend in cui decine di palazzi, fra pubblici e privati, aprono al pubblico raccontati dai Divulgatori Scientifici. E poi spettacoli, musica, eventi collaterali.\nScopri le informazioni sulla prossima edizione dei Rolli Days\n\nLe visite guidate \nLasciati stupire dal fascino dei Palazzi dei Rolli e scopri alcune delle sontuose residenze grazie alla visita guidata \"Le splendide dimore genovesi del ‘500\"! Ogni sabato, guide turistiche abilitate ti conducono attraverso il centro storico, alla ricerca dei palazzi più belli.\nPer prenotare la tua visita vai allo store \n \n\nLa Rolli Experience\nVivi un weekend come un ospite della Repubblica di Genova: pernottamento in strutture all’interno dei Palazzi dei Rolli, percorsi guidati tematici al centro storico, visite curate da divulgatori scientifici, degustazioni e intrattenimento musicale.', 'img/rolli_intro.jpg', 'https://www.youtube.com/playlist?list=PLisNxdJaZJKuPUwVDLU0AkCRi3QzC_BD_', 'https://www.youtube.com/embed/ZgfuSchcyCo?si=xbVsz1jhgCAuGcos', NULL, 0),
(29, 1, 'Introduzione al percorso di Genova storica', 'Dal 2006, UNESCO riconosce gli splendidi palazzi rinascimentali e barocchi dell’aristocrazia di Genova come Patrimonio Mondiale dell’Umanità, con il nome ufficiale “Le Strade Nuove e il sistema dei Palazzi del Rolli”.\n\nIl sito UNESCO comprende 42 palazzi, fra gli oltre 100 ancora esistenti attraverso tutto il centro storico della città. In molti casi i palazzi sono di proprietà privata, sedi di aziende e uffici, o tuttora abitati da nobili famiglie. Ma molti Palazzi dei Rolli sono visitabili tutto l’anno.\n\nPossiamo ammirare in qualsiasi momento i palazzi che sono diventati Musei: i tre palazzi che compongono i Musei di Strada Nuova, la Galleria Nazionale di Palazzo Spinola di Pellicceria, il Museo di Palazzo Reale; altri sono sedi di enti e istituzioni che permettono di visitarli almeno in parte; alcuni palazzi, di proprietà privata, ospitano mostre e iniziative culturali. Inoltre, passeggiando per il centro storico si possono ammirare spesso gli atrii e i cortili decorati di molti palazzi.\n\nConsulta le schede qui sotto per scoprire orari e modalità di visita dei Palazzi dei Rolli sempre aperti, e consulta la mappa per orientarti nel centro storico!\n\nI Rolli Days\nL\'appuntamento più atteso: un weekend in cui decine di palazzi, fra pubblici e privati, aprono al pubblico raccontati dai Divulgatori Scientifici. E poi spettacoli, musica, eventi collaterali.\nScopri le informazioni sulla prossima edizione dei Rolli Days\n\nLe visite guidate \nLasciati stupire dal fascino dei Palazzi dei Rolli e scopri alcune delle sontuose residenze grazie alla visita guidata \"Le splendide dimore genovesi del ‘500\"! Ogni sabato, guide turistiche abilitate ti conducono attraverso il centro storico, alla ricerca dei palazzi più belli.\nPer prenotare la tua visita vai allo store \n \n\nLa Rolli Experience\nVivi un weekend come un ospite della Repubblica di Genova: pernottamento in strutture all’interno dei Palazzi dei Rolli, percorsi guidati tematici al centro storico, visite curate da divulgatori scientifici, degustazioni e intrattenimento musicale.', 'img/intro_genova.jpg', NULL, NULL, NULL, 0),
(30, 1, 'Acquario di Genova', 'L\'Acquario di Genova è una delle attrazioni più celebri d\'Italia, situato nel Porto Antico e progettato da Renzo Piano. Visitabile tutti i giorni, il biglietto d\'ingresso è di circa 27€ per adulti e 19€ per bambini. L\'acquario ospita oltre 12.000 animali di 600 specie differenti, provenienti da tutti gli oceani del mondo: squali, delfini, lamantini, pinguini e meduse. Le vasche sono progettate per ricreare fedelmente gli habitat naturali, offrendo un\'esperienza immersiva e educativa. ⭐ Curiosità: l\'acquario è il più grande d\'Italia e tra i più tecnologicamente avanzati d\'Europa.', 'img/acquario.jpg', 'https://www.google.it/maps/place/Acquario+di+Genova/@44.4100179,8.9228461,17z/data=!4m6!3m5!1s0x12d343e101e57227:0x57b7c3ba05fd1126!8m2!3d44.4102211!4d8.9266709!16s%2Fm%2F02r86lq?entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 1),
(31, 1, 'Palazzo San Giorgio', 'Il Palazzo San Giorgio è uno degli edifici storici più importanti di Genova. La sua facciata, decorata con splendidi affreschi, racconta le gesta di San Giorgio e rappresenta l\'orgoglio della città medievale. Sebbene visitabile solo in occasioni speciali, è possibile ammirarlo esternamente tutti i giorni. ⭐ Curiosità: fu sede del Banco di San Giorgio, una delle prime istituzioni bancarie del mondo, che finanziò anche esplorazioni come quelle di Cristoforo Colombo. Il palazzo è oggi sede dell\'Autorità Portuale.', 'img/palazzo_san_giorgio.jpg', 'https://www.google.it/maps/place/Piazza+S.+Lorenzo,+16123+Genova+GE/@44.4079527,8.9304337,19z/data=!3m1!4b1!4m6!3m5!1s0x12d343e75af7785f:0x44e23d63233a7734!8m2!3d44.4079517!4d8.9310774!16s%2Fg%2F1vkr0pvj?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw', NULL, NULL, 2),
(32, 1, 'Cattedrale di San Lorenzo', 'La Cattedrale di San Lorenzo è il principale luogo di culto cattolico della città. L\'ingresso è gratuito, mentre il museo del Tesoro e la cripta sono accessibili con un biglietto di circa 6€. L\'architettura romanico-gotica presenta una suggestiva facciata a fasce bianche e nere. ⭐ Curiosità: all\'interno si conserva il \"Sacro Catino\", che la tradizione indica come il Santo Graal. Inoltre, una bomba inesplosa della Seconda Guerra Mondiale è esposta nella navata laterale, testimone della resilienza della città.', 'img/san_lorenzo.jpg', 'https://www.google.it/maps/place/Piazza+S.+Lorenzo,+16123+Genova+GE/@44.4079517,8.9310774,18z/data=!3m1!4b1!4m6!3m5!1s0x12d343e75af7785f:0x44e23d63233a7734!8m2!3d44.4079517!4d8.9310774!16s%2Fg%2F1vkr0pvj?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoJLDEwMj', NULL, NULL, 3),
(33, 1, 'Palazzo Ducale di Genova', 'Palazzo Ducale è oggi uno dei principali centri culturali della città, sede di mostre temporanee, conferenze ed eventi. L\'ingresso al palazzo è gratuito, mentre le esposizioni sono a pagamento (tra 5€ e 15€ a seconda dell\'evento). Storicamente fu la residenza dei Dogi della Repubblica di Genova. ⭐ Curiosità: nelle sue sale si sono prese decisioni storiche fondamentali per il destino della città. Oggi ospita anche una delle più ricche biblioteche cittadine e la magnifica Sala del Maggior Consiglio.', 'img/palazzo_ducale.jpg', 'https://www.google.it/maps/place/Palazzo+Ducale/@44.4075196,8.9306759,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343dd7fd645db:0xaa22692f44c315c1!8m2!3d44.4075158!4d8.9332508!16s%2Fm%2F04zxf64?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 4),
(34, 1, 'Piazza De Ferrari', 'Piazza De Ferrari è il fulcro della Genova moderna, crocevia tra la città antica e quella ottocentesca. Completamente pedonalizzata, è visitabile gratuitamente in ogni momento. ⭐ Curiosità: la fontana al centro è spesso usata come punto d\'incontro e fu progettata nel 1936. Attorno alla piazza sorgono importanti edifici come il Palazzo della Regione, il Teatro Carlo Felice e la sede storica della Banca d\'Italia. Spesso vi si tengono eventi, manifestazioni culturali e concerti.', 'img/piazza_de_ferrari.jpg', 'https://www.google.it/maps/place/Piazza+Raffaele+de+Ferrari/@44.407185,8.9314613,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343e78a83d311:0x67824d47c5b517de!8m2!3d44.4071812!4d8.9340362!16s%2Fm%2F04z_nlp?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 5),
(35, 1, 'Casa di Cristoforo Colombo', 'Nel cuore del centro storico di Genova, accanto alle antiche mura di Porta Soprana, sorge la Casa di Colombo, simbolo leggendario dell’infanzia del grande navigatore Cristoforo Colombo. Sebbene l’edificio attuale sia una ricostruzione settecentesca, si ritiene sorga sulle fondamenta dell’abitazione originale della famiglia Colombo. Modesta e raccolta, la casa racconta con semplicità le umili origini di colui che avrebbe cambiato la storia del mondo. Visitandola, si respira il passato di una Genova mercantile e marinara, culla di esploratori e di sogni oltre l’orizzonte.\n', 'img/colombo.jpg', 'https://www.google.it/maps/place/Casa+di+Cristoforo+Colombo/@44.4056089,8.9302293,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343dd2b4c3dc5:0x90aa102355a8cf6d!8m2!3d44.4056052!4d8.9351002!16s%2Fg%2F12203wm2?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 6),
(40, 2, 'Palazzo Carrega-Cataldi', 'Costruito nel XVI secolo, Palazzo Carrega-Cataldi è un capolavoro manierista con ricche decorazioni ad affresco. Visitabile solo in occasione dei Rolli Days, quando apre le sue porte al pubblico. ⭐ Curiosità: ospita affreschi attribuiti a Perin del Vaga e una spettacolare Sala Dorata.', 'img/carrega.jpg', 'https://www.google.it/maps/place/Palazzo+Carrega-Cataldi/@44.4108158,8.929219,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343e661855b99:0x99ca22c0158e3342!8m2!3d44.4108121!4d8.9340899!16s%2Fg%2F1229bpgk?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 1),
(41, 2, 'Palazzo Nicolosio Lomellino', 'Uno dei pochi palazzi ancora abitati ma parzialmente visitabili. Il giardino pensile e gli affreschi interni sono tra i più raffinati di Via Garibaldi. Ingresso durante eventi come Rolli Days. ⭐ Curiosità: il cortile ospita una scenografica fontana e statue antiche.', 'img/lomellino.jpg', 'https://www.google.it/maps/place/Palazzo+Lomellino/@44.4111413,8.9308857,17z/data=!3m2!4b1!5s0x12d343e86e6f1e81:0x81680ab3d57406c6!4m6!3m5!1s0x12d343e666570e83:0x9124ee463891e495!8m2!3d44.4111375!4d8.9334606!16s%2Fg%2F120htjkd?hl=it&entry=ttu&g_ep=EgoyMDI', NULL, NULL, 2),
(42, 2, 'Palazzo Doria Tursi', 'Oggi sede del Comune di Genova, è uno dei palazzi più imponenti della città. Parte del sistema museale dei Palazzi di Strada Nuova (biglietto intero ~9€). ⭐ Curiosità: al suo interno è custodito il celebre violino di Paganini.', 'img/tursi.jpg', 'https://www.google.it/maps/place/Palazzo+Doria+Tursi/@44.411386,8.9300756,17z/data=!3m2!4b1!5s0x12d343e6866b63a5:0xe996c4f67df1b3e2!4m6!3m5!1s0x12d343e6896d1cd9:0xb507ed5992cbe319!8m2!3d44.4113822!4d8.9326505!16s%2Fg%2F12276p4p?hl=it&entry=ttu&g_ep=EgoyMD', NULL, NULL, 3),
(43, 2, 'Palazzo Rosso', 'Museo civico con importanti collezioni pittoriche. Visitabile tutti i giorni, biglietto incluso nel circuito dei Musei di Strada Nuova. ⭐ Curiosità: dai tetti del palazzo si può godere di una vista spettacolare su Genova.', 'img/rosso.jpg', 'https://www.google.it/maps/place/Musei+di+Strada+Nuova+-Palazzo+Rosso/@44.4111368,8.9272351,17z/data=!3m2!4b1!5s0x12d343e6623d3e0d:0x52a2a271b55b1948!4m6!3m5!1s0x12d343e6920bd0ef:0xf61cc9c6ec074e55!8m2!3d44.4111331!4d8.932106!16s%2Fm%2F04_0rtt?hl=it&entry', NULL, NULL, 4),
(44, 2, 'Palazzo Bianco', 'Ospita una delle più importanti gallerie d’arte italiane, con opere di Caravaggio, Rubens e Van Dyck. ⭐ Curiosità: il percorso museale include anche un magnifico giardino interno e suggestivi cortili barocchi.', 'img/bianco.jpg', 'https://www.google.it/maps/place/Palazzo+Bianco/@44.4114004,8.9294185,17z/data=!3m2!4b1!5s0x12d343e6f8311f5b:0xd87a04c749a5f429!4m6!3m5!1s0x12d343e6856a8003:0x8286bc9d898c3342!8m2!3d44.4113966!4d8.9319934!16s%2Fm%2F026s40x?hl=it&entry=ttu&g_ep=EgoyMDI1MDU', NULL, NULL, 5),
(45, 2, 'Palazzo Grimaldi della Meridiana', 'Con accesso da Salita San Francesco, questo palazzo è visitabile su appuntamento o durante eventi. Il nome deriva dalla meridiana sulla facciata. ⭐ Curiosità: gli affreschi di Luca Cambiaso ne decorano le sale con scene mitologiche.', 'img/meridiana.jpg', 'https://www.google.it/maps/place/Palazzo+Grimaldi+della+Meridiana/@44.4117232,8.9288807,17z/data=!3m2!4b1!5s0x12d343e6989d21b9:0x616bcf1b619be42!4m6!3m5!1s0x12d343e6d2a13bd9:0x7cda79dcee2e248a!8m2!3d44.4117194!4d8.9314556!16s%2Fg%2F120vbsj5?hl=it&entry=tt', NULL, NULL, 6),
(46, 2, 'Palazzo Gio. Francesco Balbi', 'Risalente al XVI secolo, si affaccia su Via Balbi, strada tracciata per collegare i nobili al porto. ⭐ Curiosità: ora sede di uffici universitari, ha mantenuto gran parte delle sue decorazioni originali.', 'img/balbi.jpg', 'https://www.google.it/maps/place/Palazzo+Francesco+Maria+Balbi+Piovera/@44.4146025,8.9242029,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343e256d87979:0x1ba58c13160ce229!8m2!3d44.4145987!4d8.9267778!16s%2Fg%2F120z1t6c?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAF', NULL, NULL, 7),
(47, 2, 'Palazzo Balbi Senarega', 'Oggi sede della Facoltà di Lettere e Filosofia dell’Università di Genova. È visitabile su appuntamento. ⭐ Curiosità: conserva ancora splendide sale decorate a stucco e affreschi storici.', 'img/senarega.jpg', 'https://www.google.it/maps/place/Palazzo+Senarega/@44.4093578,8.9279042,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343e72e0ef5a5:0x57aa3e06e7579f45!8m2!3d44.409354!4d8.9304791!16s%2Fg%2F122czxn5?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 8),
(48, 2, 'Palazzo Reale', 'Antica residenza della famiglia Balbi e successivamente dei Savoia, è oggi un museo statale aperto al pubblico (biglietto 6€). ⭐ Curiosità: al suo interno si trovano arredi originali, una galleria degli specchi e un giardino pensile con vista porto.', 'img/reale.jpg', 'https://www.google.it/maps/place/Musei+Nazionali+di+Genova+-+Palazzo+Reale/@44.4149852,8.92118,17z/data=!3m2!4b1!5s0x12d343e25a4c7053:0x2de46003769a1af!4m6!3m5!1s0x12d343e2f4dcfb31:0xcc516776a4a7c766!8m2!3d44.4149815!4d8.9260509!16s%2Fm%2F0h_92km?hl=it&en', NULL, NULL, 9),
(49, 2, 'Palazzo Spinola di San Luca', 'Sede della Galleria Nazionale di Palazzo Spinola, è una casa-museo dove tutto è rimasto come nell’epoca barocca. ⭐ Curiosità: tra dipinti, arazzi e ceramiche, si può ammirare anche una preziosa collezione di miniature.', 'img/spinola.jpg', 'https://www.google.it/maps/place/Musei+Nazionali+di+Genova+-+Palazzo+Spinola/@44.4108715,8.9276415,17z/data=!3m2!4b1!5s0x12d343e133314e1f:0x2d8a394accf30327!4m6!3m5!1s0x12d343e6c94f1553:0x41a7b587a80cb338!8m2!3d44.4108677!4d8.9302164!16s%2Fg%2F112yg4zk6?h', NULL, NULL, 10),
(50, 3, 'Belvedere Bachernia', 'La prima tappa del nostro percorso panoramico parte dal Belvedere Bachernia, uno dei luoghi più incantevoli per ammirare Genova dall’alto. Situato lungo Via Domenico Chiodo, regala una vista panoramica straordinaria sulla città, il porto, la Lanterna e il profilo montuoso ligure che si getta nel mare. Ideale per iniziare l’itinerario con calma, è perfetto per chi ama scattare foto, leggere all’ombra o semplicemente contemplare il paesaggio. È accessibile a tutti e completamente gratuito. Durante le giornate limpide, si riesce a vedere fino alle Alpi Marittime. Un angolo romantico e poco frequentato, ideale anche per un picnic con vista.', 'img/bachernia.jpg', 'https://www.google.it/maps/place/Belvedere+Bachernia/@44.4182397,8.9381575,17z/data=!3m1!4b1!4m6!3m5!1s0x12d3432c95e8f925:0x55b046658515d4e5!8m2!3d44.4182359!4d8.9407324!16s%2Fg%2F11f86dcl69?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 1),
(51, 3, 'Parco Avventura Righi', 'Immerso tra i boschi sopra Genova, il Parco Avventura Righi è il posto perfetto per un momento di svago e adrenalina. Offre numerosi percorsi sospesi tra gli alberi con difficoltà crescenti, adatti sia a bambini che ad adulti. Il parco promuove il contatto diretto con la natura, in totale sicurezza, e rappresenta una pausa attiva e coinvolgente. I costi variano da 10 a 20 euro a seconda del percorso scelto e della durata. È fortemente consigliata la prenotazione, soprattutto nei weekend. Oltre alle attività, l’area è attrezzata con tavoli, punti ristoro e percorsi natura. Perfetto per ricaricarsi prima di proseguire l’itinerario.', 'img/righi_avventura.jpg', 'https://www.google.it/maps/place/Parco+Avventura+Righi/@44.421879,8.937058,16z/data=!3m1!4b1!4m6!3m5!1s0x12d34409ebaf0325:0xa0d91de084eeeccd!8m2!3d44.4218752!4d8.9396329!16s%2Fg%2F11c1nxsgf1?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D', NULL, NULL, 2),
(52, 3, 'Osservatorio Astronomico del Righi', 'L’Osservatorio Astronomico del Righi, incastonato lungo le Mura delle Chiappe, è una piccola perla per gli appassionati di scienza, cielo e misteri dell’universo. Nato nel XIX secolo, oggi è gestito da appassionati che organizzano eventi, visite guidate e serate osservative. Durante queste occasioni, si può osservare la Luna, i pianeti e persino nebulose e galassie attraverso i telescopi disponibili. Le serate pubbliche, dal costo contenuto (circa 5€), sono accessibili su prenotazione e adatte anche ai bambini. È un luogo unico dove il cielo incontra la storia, in una cornice panoramica indimenticabile.', 'img/osservatorio.jpg', 'https://www.google.it/maps/place/Osservatorio+Astronomico+del+Righi/@44.425479,8.9334199,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343f6e5c9b375:0x7c404b59ed453703!8m2!3d44.4254752!4d8.9359948!16s%2Fg%2F1260ssxj4?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw', NULL, NULL, 3),
(53, 3, 'Forte Sperone', 'Situato nel punto più alto della cerchia dei forti genovesi, Forte Sperone è una vera e propria cittadella militare in pietra, costruita tra il XVII e il XIX secolo. Da qui si domina tutta la città, con viste a 360 gradi che spaziano dal Mar Ligure fino all’Appennino. Il forte è visitabile esternamente in ogni momento, ed è spesso aperto per visite guidate gratuite o con contributo simbolico durante eventi o giornate FAI. All’interno si scoprono bastioni, passaggi sotterranei e piazzali che raccontano la storia difensiva di Genova. Un luogo carico di fascino e silenzio, dove storia e natura si fondono in un’esperienza profonda e rigenerante.', 'img/fortesperone.jpg', 'https://www.google.it/maps/place/Forte+Sperone/@44.4405214,8.9278462,17z/data=!3m1!4b1!4m6!3m5!1s0x12d34419569b7e87:0x34499d18cc29afd6!8m2!3d44.4405176!4d8.9304211!16s%2Fg%2F121_458g?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D ', NULL, NULL, 4),
(59, 3, 'Introduzione: Genova dall\'alto', 'Questa passeggiata panoramica è un invito a scoprire Genova da una prospettiva insolita e suggestiva: dall’alto. Camminando lungo le creste che circondano la città, tra boschi, antichi forti e punti di osservazione mozzafiato, si apre davanti agli occhi un panorama unico: il mare che abbraccia la città, il porto con la sua storia millenaria, i tetti stretti del centro storico e l’orizzonte che si fonde con il cielo. Questo itinerario è perfetto per chi ama la natura, la fotografia e vuole vivere un’esperienza rigenerante a contatto con la bellezza autentica di Genova. Preparati a camminare tra cielo e mare, con Genova ai tuoi piedi.', 'img/intro_genova_dall_alto.jpg', NULL, NULL, NULL, 0),
(60, 4, 'Belvedere Bachernia', 'Il Belvedere Bachernia è uno dei luoghi più incantevoli per ammirare Genova dall’alto. Situato lungo Via Domenico Chiodo, regala una vista panoramica straordinaria sulla città, il porto, la Lanterna e il profilo montuoso ligure che si getta nel mare. Ideale per iniziare l’itinerario con calma, è perfetto per chi ama scattare foto, leggere all’ombra o semplicemente contemplare il paesaggio. È accessibile a tutti e completamente gratuito. Durante le giornate limpide, si riesce a vedere fino alle Alpi Marittime. Un angolo romantico e poco frequentato, ideale anche per un picnic con vista.', 'img/bachernia.jpg', 'https://maps.app.goo.gl/XYZBachernia', NULL, NULL, 1),
(61, 4, 'Parco Avventura Righi', 'Immerso tra i boschi sopra Genova, il Parco Avventura Righi è il posto perfetto per un momento di svago e adrenalina. Offre numerosi percorsi sospesi tra gli alberi con difficoltà crescenti, adatti sia a bambini che ad adulti. Il parco promuove il contatto diretto con la natura, in totale sicurezza, e rappresenta una pausa attiva e coinvolgente. I costi variano da 10 a 20 euro a seconda del percorso scelto e della durata. È fortemente consigliata la prenotazione, soprattutto nei weekend. Oltre alle attività, l’area è attrezzata con tavoli, punti ristoro e percorsi natura. Perfetto per ricaricarsi prima di proseguire l’itinerario.', 'img/righi_avventura.jpg', 'https://maps.app.goo.gl/XYZParcoRighi', NULL, NULL, 2),
(63, 4, 'Osservatorio Astronomico del Righi', 'L’Osservatorio Astronomico del Righi, incastonato lungo le Mura delle Chiappe, è una piccola perla per gli appassionati di scienza, cielo e misteri dell’universo. Nato nel XIX secolo, oggi è gestito da appassionati che organizzano eventi, visite guidate e serate osservative. Durante queste occasioni, si può osservare la Luna, i pianeti e persino nebulose e galassie attraverso i telescopi disponibili. Le serate pubbliche, dal costo contenuto (circa 5€), sono accessibili su prenotazione e adatte anche ai bambini. È un luogo unico dove il cielo incontra la storia, in una cornice panoramica indimenticabile.', 'img/osservatorio.jpg', 'https://maps.app.goo.gl/XYZOsservatorio', NULL, NULL, 3),
(64, 4, 'Forte Sperone', 'Situato nel punto più alto della cerchia dei forti genovesi, Forte Sperone è una vera e propria cittadella militare in pietra, costruita tra il XVII e il XIX secolo. Da qui si domina tutta la città, con viste a 360 gradi che spaziano dal Mar Ligure fino all’Appennino. Il forte è visitabile esternamente in ogni momento, ed è spesso aperto per visite guidate gratuite o con contributo simbolico durante eventi o giornate FAI. All’interno si scoprono bastioni, passaggi sotterranei e piazzali che raccontano la storia difensiva di Genova. Un luogo carico di fascino e silenzio, dove storia e natura si fondono in un’esperienza profonda e rigenerante.', 'img/fortesperone.jpg', 'https://maps.app.goo.gl/XYZSperone', NULL, NULL, 4),
(70, 5, 'Introduzione: Genova Nervi e i suoi affacci sul mare', 'Questo itinerario ti conduce attraverso una delle zone più affascinanti e panoramiche di Genova: Nervi. Quartiere elegante e tranquillo, incastonato tra scogliere e verde, Nervi è famoso per le sue viste mozzafiato sul Mar Ligure, i suoi parchi curati e le ville nobiliari trasformate in musei. La Passeggiata Anita Garibaldi, uno dei punti più iconici del quartiere, offre una passeggiata a picco sul mare tra palme, fiori, onde e tramonti indimenticabili. Ideale per chi cerca relax, bellezza naturale e un tocco culturale.', 'img/intro_nervi.jpg', NULL, NULL, NULL, 0),
(71, 5, 'Parchi di Nervi', 'I Parchi di Nervi sono una vera oasi di pace: un grande parco pubblico nato dall’unione dei giardini di antiche ville nobiliari, tra cui Villa Gropallo, Villa Saluzzo Serra e Villa Grimaldi Fassio. I prati curati, le palme, gli alberi secolari e l’incredibile vista sul mare rendono questo luogo perfetto per una passeggiata romantica o un picnic. Durante la primavera, il Roseto Nino Cipri è in piena fioritura. L’accesso ai parchi è gratuito, e spesso ospitano eventi culturali e musicali.', 'img/parchi_nervi.jpg', 'https://www.google.it/maps/place/Parchi+di+Nervi/@44.3811214,9.0409707,17z/data=!3m1!4b1!4m6!3m5!1s0x12d35d11af44a9e5:0x4397f6518f0220f1!8m2!3d44.3811176!4d9.0435456!16s%2Fg%2F121l5g43?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D ', NULL, NULL, 1),
(72, 5, 'Galleria d\'Arte Moderna di Nervi', 'All’interno di Villa Saluzzo Serra, elegante dimora del XVIII secolo immersa nei Parchi di Nervi, si trova la Galleria d’Arte Moderna di Genova. Il museo ospita una prestigiosa collezione di opere che vanno dal XIX secolo al Novecento, con artisti come De Pisis, Morandi, Tosi e molti altri. Il biglietto di ingresso costa circa 5€, ridotto 3€. Oltre all’arte, merita una visita l’architettura raffinata della villa e la terrazza con vista sul parco.', 'img/gam_nervi.jpg', 'https://www.google.it/maps/place/Museo+Galleria+d\'Arte+Moderna+(Villa+Saluzzo+Serra)/@44.3822007,9.0430959,17z/data=!3m1!4b1!4m6!3m5!1s0x12d3474651cde105:0x6f4624d832d33906!8m2!3d44.3821969!4d9.0456708!16s%2Fg%2F120wrmvv?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyM', NULL, NULL, 2),
(73, 5, 'Panchina panoramica di Nervi', 'Una delle panchine più famose e romantiche di Genova si trova lungo la Passeggiata Anita Garibaldi, immersa nel profumo del mare e circondata da fiori e gabbiani. Questo punto è ideale per ammirare il tramonto, leggere un libro o semplicemente godersi la brezza marina. Curiosità: è spesso scelta come location per foto di fidanzamenti o servizi fotografici.', 'img/panchina_nervi.jpg', 'https://www.google.it/maps/place/Panchina+Nervi/@44.3803142,9.0437285,17z/data=!3m1!4b1!4m6!3m5!1s0x12d35d00194d70f7:0xb8322cbaa2037c7c!8m2!3d44.3803104!4d9.0463034!16s%2Fg%2F11m6rmn39l?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D ', NULL, NULL, 3),
(74, 5, 'Passeggiata Anita Garibaldi', 'La Passeggiata Anita Garibaldi è uno dei luoghi simbolo di Nervi. Questo percorso pedonale di oltre 2 km si snoda lungo la scogliera, offrendo una vista impareggiabile sul Golfo di Genova. Lungo il cammino si trovano bar, gelaterie, panchine e scorci mozzafiato. Gratuita e accessibile a tutti, è perfetta in ogni stagione. Una leggenda locale racconta che molti marinai partivano dal porto sottostante salutando le loro famiglie da questa passeggiata.', 'img/anita_garibaldi.jpg', 'https://www.google.it/maps/place/Passeggiata+Anita+Garibaldi,+16167+Genova+GE/@44.3807486,9.0390979,17z/data=!3m1!4b1!4m6!3m5!1s0x12d35ce2470e6f17:0x4b2c5ebcaf44de76!8m2!3d44.3807448!4d9.0416728!16s%2Fg%2F121g71tm?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXM', NULL, NULL, 4),
(90, 7, 'Introduzione: La Resistenza a Genova', 'Genova fu una delle città più attive nel movimento di Resistenza contro il nazifascismo. I suoi quartieri, le sue colline e le sue piazze furono teatro di atti di eroismo, sabotaggi e rivolte popolari. La città venne insignita della Medaglia d’Oro al Valor Militare per il ruolo cruciale svolto dalla popolazione e dai partigiani nella liberazione. Questo itinerario è un tributo a quei giorni, a quegli uomini e a quelle donne che hanno lottato per restituire dignità e libertà all’Italia. Passeggiando tra le vie storiche, ogni tappa racconta un pezzo di quella storia che ha plasmato il volto della Repubblica.', 'img/resistenza_intro.jpg', NULL, NULL, NULL, 0),
(91, 7, 'Piazza della Vittoria', 'Questa grande piazza fu uno dei luoghi chiave durante le manifestazioni contro il regime. Il monumentale arco di trionfo dedicato ai caduti della Prima Guerra Mondiale è oggi anche un simbolo del sacrificio dei partigiani. Luogo spesso scelto per cerimonie e commemorazioni, offre un potente richiamo alla memoria collettiva.', 'img/piazza_vittoria.jpg', 'https://www.google.it/maps/place/Piazza+della+Vittoria,+16121+Genova+GE/@44.4028891,8.9429349,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343c0ebc6c827:0x51896106a5797646!8m2!3d44.4028853!4d8.9455098!16s%2Fg%2F119w757hg?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoAS', NULL, NULL, 1),
(92, 7, 'Via XX Settembre', 'Via XX Settembre, oggi arteria commerciale e cuore pulsante della città, durante la Resistenza fu attraversata da cortei clandestini e teatro di scontri. Nei palazzi lungo la via si nascondevano spesso cellule partigiane o venivano distribuiti volantini antifascisti. Camminarci oggi significa percorrere una via di libertà conquistata con il sangue.', 'img/via_20_settembre.jpg', 'https://www.google.it/maps/place/Via+XX+Settembre,+Genova+GE/@44.4059513,8.9368841,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343c26b78eb7d:0x3dd280ef356975f!8m2!3d44.4059475!4d8.939459!16s%2Fg%2F119vg93s8?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3D ', NULL, NULL, 2),
(93, 7, 'Via Assarotti', 'Questa lunga via in salita fu centro di movimenti antifascisti. Alcuni edifici ospitarono comandi clandestini e luoghi di rifugio per perseguitati politici. Un tempo zona residenziale borghese, durante la guerra vide molti dei suoi abitanti impegnati nella rete della Resistenza.', 'img/via_assarotti.jpg', 'https://www.google.it/maps/place/Via+Assarotti,+16122+Genova+GE/@44.4118169,8.9396631,17z/data=!3m1!4b1!4m6!3m5!1s0x12d343ec6d312a09:0x18f8a53acea92bb3!8m2!3d44.4118131!4d8.942238!16s%2Fg%2F1vs3103y?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3', NULL, NULL, 3),
(94, 7, 'Cimitero Monumentale di Staglieno', 'Oltre a essere uno dei cimiteri monumentali più importanti d’Europa, Staglieno è luogo di memoria della Resistenza. Qui riposano molti partigiani, tra cui figure storiche genovesi. Camminare tra le sue statue e mausolei significa anche onorare chi ha dato la vita per la libertà. Diverse lapidi commemorano i caduti partigiani e i deportati nei campi di concentramento.', 'img/staglieno.jpg', 'https://www.google.it/maps/place/Staglieno+Cimitero+Monumentale/@44.4292292,8.9459112,16z/data=!3m1!4b1!4m6!3m5!1s0x12d344741670339d:0xdb14fceb1d050f57!8m2!3d44.4292255!4d8.9507821!16s%2Fm%2F043m008?hl=it&entry=ttu&g_ep=EgoyMDI1MDUyMS4wIKXMDSoASAFQAw%3D%3', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `tariffe`
--

CREATE TABLE `tariffe` (
  `ID` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL CHECK (`tipo` in ('base','intermedia','piena')),
  `costo` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tariffe`
--

INSERT INTO `tariffe` (`ID`, `tipo`, `costo`) VALUES
(1, 'base', 5.00),
(2, 'intermedia', 10.00),
(3, 'piena', 15.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `dataNascita` date DEFAULT NULL,
  `tariffa` int(11) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID`, `nome`, `cognome`, `email`, `password`, `dataNascita`, `tariffa`, `role`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@example.com', 'password123', '1980-06-15', 1, 'user'),
(2, 'Luca', 'Bianchi', 'luca.bianchi@example.com', 'password456', '1990-01-25', 2, 'user'),
(3, 'a', 'a', 'a@a', '$2y$10$3Lj4j9c0F8.cvgZkERH10.d56ajiWSKylbs081974yMRUpSjmpA5m', '2025-05-06', 1, 'user'),
(4, 'pippo', NULL, NULL, '000', NULL, 0, 'admin'),
(5, 'pippo', NULL, 'marco@danovaro.it', '000', NULL, 0, 'admin'),
(6, 'admin', 'admin', 'admin@a', 'ciao', NULL, 1, 'admin'),
(7, 'p', 'p', 'p@p', '$2y$10$XY5CEhngkRp6mRljEUQ65OwpnXntzu02MV2/a1GDjKKYQ7roJTf2W', '2025-04-29', 1, 'user'),
(8, 'admin', 'admin', 'admin@admin', '$2y$10$/Lb7XDZK3f0GGhqm5lNCMOYF4yiljr1DYrTT59FWAmK09eFEOtRzS', '1111-11-11', 3, 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `utentehainteresse`
--

CREATE TABLE `utentehainteresse` (
  `ID` int(11) NOT NULL,
  `id_interesse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utentehainteresse`
--

INSERT INTO `utentehainteresse` (`ID`, `id_interesse`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `utentesceglieitinerario`
--

CREATE TABLE `utentesceglieitinerario` (
  `IDUtente` int(11) NOT NULL,
  `IDItinerario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utentesceglieitinerario`
--

INSERT INTO `utentesceglieitinerario` (`IDUtente`, `IDItinerario`) VALUES
(8, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisti`
--
ALTER TABLE `acquisti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `itinerario_id` (`itinerario_id`);

--
-- Indici per le tabelle `biglietto`
--
ALTER TABLE `biglietto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDUtente` (`IDUtente`),
  ADD KEY `IDTariffa` (`IDTariffa`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `informazioni`
--
ALTER TABLE `informazioni`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `lingua` (`lingua`),
  ADD KEY `IDPOI` (`IDPOI`),
  ADD KEY `IDTariffa` (`IDTariffa`);

--
-- Indici per le tabelle `interesse`
--
ALTER TABLE `interesse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indici per le tabelle `itinerario`
--
ALTER TABLE `itinerario`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `lingue`
--
ALTER TABLE `lingue`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `poi`
--
ALTER TABLE `poi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `nome` (`nome`),
  ADD KEY `tappa_id` (`tappa_id`),
  ADD KEY `lingua_id` (`lingua_id`);

--
-- Indici per le tabelle `tappa`
--
ALTER TABLE `tappa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `tappa_ibfk_1` (`IDItinerario`);

--
-- Indici per le tabelle `tariffe`
--
ALTER TABLE `tariffe`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `tariffa` (`tariffa`);

--
-- Indici per le tabelle `utentehainteresse`
--
ALTER TABLE `utentehainteresse`
  ADD PRIMARY KEY (`ID`,`id_interesse`),
  ADD KEY `nome` (`id_interesse`);

--
-- Indici per le tabelle `utentesceglieitinerario`
--
ALTER TABLE `utentesceglieitinerario`
  ADD PRIMARY KEY (`IDUtente`,`IDItinerario`),
  ADD KEY `IDItinerario` (`IDItinerario`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `biglietto`
--
ALTER TABLE `biglietto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `informazioni`
--
ALTER TABLE `informazioni`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `itinerario`
--
ALTER TABLE `itinerario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `poi`
--
ALTER TABLE `poi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `tappa`
--
ALTER TABLE `tappa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT per la tabella `tariffe`
--
ALTER TABLE `tariffe`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  ADD CONSTRAINT `acquisti_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utente` (`ID`),
  ADD CONSTRAINT `acquisti_ibfk_2` FOREIGN KEY (`itinerario_id`) REFERENCES `itinerario` (`ID`);

--
-- Limiti per la tabella `biglietto`
--
ALTER TABLE `biglietto`
  ADD CONSTRAINT `biglietto_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `biglietto_ibfk_2` FOREIGN KEY (`IDTariffa`) REFERENCES `tariffe` (`ID`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `informazioni`
--
ALTER TABLE `informazioni`
  ADD CONSTRAINT `informazioni_ibfk_1` FOREIGN KEY (`lingua`) REFERENCES `lingue` (`nome`) ON UPDATE CASCADE,
  ADD CONSTRAINT `informazioni_ibfk_2` FOREIGN KEY (`IDPOI`) REFERENCES `poi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `informazioni_ibfk_3` FOREIGN KEY (`IDTariffa`) REFERENCES `tariffe` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `tappa`
--
ALTER TABLE `tappa`
  ADD CONSTRAINT `tappa_ibfk_1` FOREIGN KEY (`IDItinerario`) REFERENCES `itinerario` (`ID`);

--
-- Limiti per la tabella `utentehainteresse`
--
ALTER TABLE `utentehainteresse`
  ADD CONSTRAINT `utentehainteresse_ibfk_1` FOREIGN KEY (`id_interesse`) REFERENCES `interesse` (`ID`),
  ADD CONSTRAINT `utentehainteresse_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `utente` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `utentesceglieitinerario`
--
ALTER TABLE `utentesceglieitinerario`
  ADD CONSTRAINT `utentesceglieitinerario_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `utentesceglieitinerario_ibfk_2` FOREIGN KEY (`IDItinerario`) REFERENCES `itinerario` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
