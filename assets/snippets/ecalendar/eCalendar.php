<?php
/**
 * eventsCalendar
 *
 * Принимает id контейнера документов и выводит их в виде календаря.
 *
 * @category 	snippet
 * @version 	2.0.6
 * @license 	bezumkin@yandex.ru & tarkvsg@gmail.com
 * @internal	@properties
 * @internal	@modx_category add

[!eventsCalendar2!]
Сниппет для MODx Evolution, принимает id контейнера документов и выводит их в виде календаря.

http://code.google.com/p/eventscalendar2/w/list

Василий Наумкин.
bezumkin@yandex.ru
webstartpage.ru
 **/

$classes_arr = get_declared_classes();

if ( ! in_array('eventsCalendar', $classes_arr)) {

    class eventsCalendar {

        var $dateFormat = '%d %b %Y %H:%M';
        var $dateSource = 'createdon';
        var $id;

        var $month = '';
        var $year = '';

        var $calendar_id = 'Calendar';

        var $class_calendar = 'calendar';
        var $class_dow = 'dow';
        var $class_month = 'month';
        var $class_workday = 'workday';
        var $class_weekend = 'weekend';
        var $class_today = 'today';
        var $class_event = 'event';
        var $class_isevent = 'isevent';
        var $class_noevent = 'noevent';
        var $class_date = 'date';
        var $class_emptyday = 'emptyday';
        var $class_prev = 'prev';
        var $class_next = 'next';
        var $btn_prev = '&laquo;';
        var $btn_next = '&raquo;';

        var $first_day = 1;

        var $lang = 'en';
        var $local = array();
        var $dow_names = '';
        var $month_names = '';

        var $time_shift = 0;
        var $parents = 0;

        var $err = 0;
        var $show_errors = 1;

        function eventsCalendar() {
            $this->local['ru']['dow'] = 'Пн,Вт,Ср,Чт,Пт,Сб,Вс';
            $this->local['ru']['month'] = 'Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,Сентябрь,Октябрь,Ноябрь,Декабрь';
            $this->local['en']['dow'] = 'Su,Mo,Tu,We,Th,Fr,Sa';
            $this->local['en']['month'] = 'January,February,March,April,May,June,July,August,September,October,November,December';

            $this->local['ru']['error']['no_id'] = 'Вы забыли указать id ресурса для выборки событий';
            $this->local['ru']['error']['no_action'] = 'Не указан метод для обработки ajax запроса';
            $this->local['ru']['error']['no_result'] = 'В указанном ресурсе нет подходящих документов';
            $this->local['en']['error']['no_id'] = 'You forgot to specify the resource id for the event selection';
            $this->local['en']['error']['no_action'] = 'Not specify a method for handling ajax request';
            $this->local['en']['error']['no_result'] = 'The specified resource has no events';
        }

        /*  Вывод ошибок    */
        function error($err) {
            return $local[$this->lang]['error'][$err];
        }

        /*    Выводит календарь на заданный месяц и год    */
        function generateCalendar() {
            //Это сильно модефицированный календарь, оригинал - вот тут: http://www.softtime.ru/scripts/calendar.php
            $month = $this->month;
            $year = $this->year;
            $id = $this->id;

            $time = mktime(0,0,0, $month, 1 ,$year);
            $dayofmonth = date('t', $time);
            $day_count = 1;
            // 1. Первая неделя
            $num = 0;

            for ($i = 0; $i < 7; $i++) {
                // Вычисляем номер дня недели для числа
                $dayofweek = date('w', mktime(0, 0, 0, $month, $day_count, $year));

                // Приводим к числа к формату 1 - понедельник, ..., 6 - суббота
                if ($this->first_day == 1) {
                    $dayofweek = $dayofweek - 1;
                    if($dayofweek == -1) {$dayofweek = 6;}
                }

                if($dayofweek == $i) {
                    // Если дни недели совпадают, заполняем массив $week числами месяца
                    $week[$num][$i] = $day_count;
                    $day_count++;
                }
                else {
                    $week[$num][$i] = '';
                }
            }

            // 2. Последующие недели месяца
            while(true) {
                $num++;

                for($i = 0; $i < 7; $i++) {
                    $week[$num][$i] = $day_count;
                    $day_count++;
                    // Если достигли конца месяца - выходим из цикла
                    if($day_count > $dayofmonth) break;
                }
                // Если достигли конца месяца - выходим из цикла
                if($day_count > $dayofmonth) break;
            }

            // 3. Выводим содержимое массива $week в виде календаря
            $next_month = $month + 1;
            if ($next_month == 13) {$next_month = 1; $next_year = $year + 1;}
            else {$next_year = $year;}

            $prev_month = $month - 1;
            if ($prev_month == 0) {$prev_month = 12; $prev_year = $year - 1;}
            else {$prev_year = $year;}


            if (empty($this->dow_names)) {$this->dow_names = $this->local[$this->lang]['dow'];}
            if (empty($this->month_names)) {$this->month_names = $this->local[$this->lang]['month'];}

            $month_names = explode(',', $this->month_names);
            $month_name = $month_names[$month - 1];
            $dow_names = explode(',', $this->dow_names);

            $events = $this->getEvents($id, $month, $year);

            if (isset($this->err) && $this->show_errors == 1) {echo $this->local[$this->lang]['error'][$this->err];}

            $table = "<table class='$this->class_calendar'>";
            $table .= "<tr>
						<td class='$this->class_prev'><a rel='$prev_month-$prev_year'>$this->btn_prev</a></td>
						<td class='$this->class_month' colspan='5'>$month_name $year</td>
						<td class='$this->class_next'><a rel='$next_month-$next_year'>$this->btn_next</a></td>
					   </tr><tr>";
            foreach ($dow_names as $v) {
                $table .= "<th class='$this->class_dow'>$v</th>";
            }
            foreach($week as $v) {
                $table .= "</tr><tr>";
                for($i = 0; $i < 7; $i++) {
                    if(!empty($v[$i])) {

                        if (strlen($v[$i]) == 1) {$day = '0'.$v[$i];} else {$day = $v[$i];}
                        $date = $year.'-'.$month.'-'.$day;
                        if ($i == 5 || $i == 6) {
                            $class = $this->class_weekend;
                        }
                        else {
                            $class = $this->class_workday;
                        }
                        if ($date == strftime('%Y-%m-%d', time() + $this->time_shift*60*60)) {$class .= ' '.$this->class_today;}
                        if ( in_array( $v[$i], $events) ) {$class .= ' '.$this->class_isevent;}
                        else {$class .= ' '.$this->class_noevent;}

                        $table .= "<td class='$class'>".
                            (in_array( $v[$i], $events) ?
                                "<div class='$this->class_date'><a rel='".$date."'>".$v[$i]."</a></div>" :
                                "<div class='$this->class_date'>".$v[$i]."</div>" ).
                            "</td>";
                    }
                    else $table .= "<td class='$this->class_emptyday'>&nbsp;</td>";
                }
            }
            $table .= "</table>";

            return $table;
        }

        /*  Вывод событий, принимает номер контейнера событий, месяц и год  */
        function getEvents($id, $month, $year) {
            global $modx;
            $days = array();


            /*	Вынимаем все используемые в этом месяце даты документов	*/
            $res = $modx->db->select("DATE_FORMAT(FROM_UNIXTIME($this->dateSource),'%d' ) AS day",
                $modx->getFullTableName('site_content'),
                "DATE_FORMAT(FROM_UNIXTIME($this->dateSource),'%m-%Y' )='".$month ."-". $year.
                "' AND deleted='0' AND published='1' AND parent='".$id."' GROUP BY day");

            while( $row = $modx->db->getRow( $res ) ) {  array_push ($days, $row["day"]); }

            //if (empty($days)) {return false;}

            return $days;
        }
    }
}

/*  Конец класса, дальше обвязка, для его использования в MODx  */

$Cal = new eventsCalendar;

$tmp = ( isset( $ddate ) ) ? explode('-',$ddate) : array( date('m'), date('Y') );
$Cal->month = ( is_numeric($tmp[0]) ) ? $tmp[0] : date('m');
if ( strlen($Cal->month) == 1 ) {$Cal->month = '0'.$Cal->month;}
$Cal->year = ( is_numeric($tmp[1]) ) ? $tmp[1] : date('Y');

/*  Если заданы параметры при вызове сниппета - переопределяем стандартные  */

$Cal->id = ( is_numeric($id) ) ? $id : $modx->documentIdentifier; // ID документа, текущий по умолчанию

if (!empty($dateSource)) {$Cal->dateSource = $dateSource;}
if (!empty($calendar_id)) {$Cal->calendar_id = $calendar_id;}
if (!empty($class_calendar)) {$Cal->class_calendar = $class_calendar;}
if (!empty($class_dow)) {$Cal->class_dow = $class_dow;}
if (!empty($class_month)) {$Cal->class_month = $class_month;}
if (!empty($class_workday)) {$Cal->class_workday = $class_workday;}
if (!empty($class_weekend)) {$Cal->class_weekend = $class_weekend;}
if (!empty($class_today)) {$Cal->class_today = $class_today;}
if (!empty($class_event)) {$Cal->class_event = $class_event;}
if (!empty($class_isevent)) {$Cal->class_isevent = $class_isevent;}
if (!empty($class_noevent)) {$Cal->class_noevent = $class_noevent;}
if (!empty($class_date)) {$Cal->class_date = $class_date;}
if (!empty($class_emptyday)) {$Cal->class_emptyday = $class_emptyday;}
if (!empty($class_prev)) {$Cal->class_prev = $class_prev;}
if (!empty($class_next)) {$Cal->class_next = $class_next;}
if (!empty($dow_names)) {$Cal->dow_names = $dow_names;}
if (!empty($month_names)) {$Cal->month_names = $month_names;}
if (!empty($btn_prev)) {$Cal->btn_prev = $btn_prev;}
if (!empty($btn_next)) {$Cal->btn_next = $btn_next;}
if (!empty($lang) && !empty($Cal->local[$lang])) {$Cal->lang = $lang;} else {
    if ($modx->config['manager_language'] == 'russian' || $modx->config['manager_language'] == 'russian-UTF8') {$Cal->lang = 'ru';}
}
if (!empty($first_day)) {$Cal->first_day = $first_day;}
//if ($show_errors == '0') {$Cal->show_errors = 0;}

return  $Cal->generateCalendar();

?>