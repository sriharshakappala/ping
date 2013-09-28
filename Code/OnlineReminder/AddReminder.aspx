<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddReminder.aspx.cs" Inherits="AddReminder" MasterPageFile="~/Main.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
       table{ text-align:left; font-family:Calibri,Courier New; font-size:large}
       th   { font-weight:bold;}
    .style12
    {
        width: 223px;
    }
    .style13
    {
        width: 292px;
    }
    .style14
    {
        width: 112px;
    }
        .style15
        {
            height: 16px;
        }
        .style17
        {
            width: 265px;
            height: 35px;
        }
        .style18
        {
            height: 35px;
        }
        .style19
        {
            width: 131px;
        }
        .style21
        {
            width: 103px;
        }
        .style22
        {
            width: 110px;
        }
        .style23
        {
            width: 16px;
        }
        .style24
        {
            width: 15px;
        }
        </style> 
 <script language="javascript">
function Checkbox4_onclick() {
    var disable=!document.getElementById("Checkbox4").checked;
    document.getElementById("<%= DropDownList1.ClientID %>").disabled=disable;
    document.getElementById("<%= DropDownList2.ClientID %>").disabled=disable;
    document.getElementById("<%= DropDownList4.ClientID %>").disabled=disable;
    document.getElementById("<%= DropDownList5.ClientID %>").disabled=disable;
    document.getElementById("<%= DropDownList6.ClientID %>").disabled=disable;
    document.getElementById("<%= DropDownList12.ClientID %>").disabled=disable;
    document.getElementById("<%= RadioButton1.ClientID %>").disabled = disable;
    document.getElementById("<%= RadioButton2.ClientID %>").disabled = disable;
    var r1=document.getElementById("<%= RadioButton1.ClientID %>");
    var r2=document.getElementById("<%= RadioButton2.ClientID %>");
    document.getElementById("<%= DropDownList3.ClientID %>").disabled=r1.disabled || (!r1.checked);
    document.getElementById("<%= DropDownList11.ClientID %>").disabled=r2.disabled || (!r2.checked);
    document.getElementById("Checkbox5").disabled=disable;
    document.getElementById("Checkbox1").disabled=disable;
}

function Checkbox5_onclick() {
    var disable=!document.getElementById("Checkbox5").checked;
    document.getElementById("<%= TextBox1.ClientID %>").disabled=disable;
    document.getElementById("<%= TextBox2.ClientID %>").disabled=disable;
    document.getElementById("<%= TextBox3.ClientID %>").disabled=disable;
}

function Checkbox1_onclick() {
    var disable=!document.getElementById("Checkbox1").checked;
    document.getElementById("<%= TextBox4.ClientID %>").disabled=disable;
    document.getElementById("<%= TextBox6.ClientID %>").disabled=disable;
}

function RadioButton1_Click()
{
     var R1Checked = document.getElementById("<%= RadioButton1.ClientID %>").checked;
     document.getElementById("<%= DropDownList3.ClientID %>").disabled = !R1Checked;
     document.getElementById("<%= DropDownList11.ClientID %>").disabled = R1Checked;
}

function ClearDroDown(DropDown)
{
    var intTotalItems= DropDown.options.length;
    
    //loop through the number of items
     for(var intCounter=intTotalItems;intCounter>=0;intCounter--)
     {
       //remove the intCounter( currently index) item from the dropDownList
       DropDown.remove(intCounter);
     }
}

function daysInMonth(iMonth, iYear)
{
	return 32 - new Date(iYear, iMonth, 32).getDate();
}

function ChangeDropDowns()
{
    var DropDown1 = document.getElementById("<%= DropDownList1.ClientID %>");
    var DropDown2 = document.getElementById("<%= DropDownList2.ClientID %>");
    var DropDown3 = document.getElementById("<%= DropDownList3.ClientID %>");
    var selectedDay=DropDown3.selectedIndex;
    ClearDroDown(DropDown3);
    var temp=document.createElement("option");
    temp.text="Every Day";
    temp.text="Every Day";
    DropDown3.options.add(temp);
    var selectedYear=DropDown1.options[DropDown1.selectedIndex].text;
    var selectedMonth=DropDown2.selectedIndex-1;
    for(var i=1;i<=daysInMonth(selectedMonth,selectedYear);i++)
    {
        var newOption=document.createElement("option");
        newOption.text=i;
        newOption.value=i;
        DropDown3.options.add(newOption);
    }
    DropDown3.selectedIndex=selectedDay;
}
window.onload = DisableRadioButtons;
function DisableRadioButtons() {
    document.getElementById("<%= RadioButton1.ClientID %>").disabled = true;
    document.getElementById("<%= RadioButton2.ClientID %>").disabled = true;
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <table>
        <tr>
            <td bgcolor="#D8D8D8">
                <asp:Panel ID="Panel2" runat="server" Width="77px" BackColor="#D8D8D8" 
                    Height="100%">
                </asp:Panel>
            </td>
            <td>
    <asp:Panel ID="Panel1" runat="server" BackColor="#D8D8D8">
        <div>
          <table>
            <tr>
                <td>
                    <table cellspacing="5" width="100%">
            <tr>
                <th align="left" valign="top" colspan="3">
                    &nbsp;Event Date</th>
            </tr>
              <tr>
                  <td class="style24">
                      &nbsp;</td>
                  <td align="center">
                      Day</td>
                  <td align="left" rowspan="6" valign="middle">
                      <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                          BorderColor="#999999" Font-Names="Calibri" Font-Size="Medium" 
                          ForeColor="Black" Height="180px" NextMonthText="►" PrevMonthText="◄" 
                          Width="268px" CellPadding="4">
                          <DayHeaderStyle Font-Bold="True" Font-Size="Medium" Font-Names="Calibri" 
                              BackColor="#CCCCCC" />
                          <NextPrevStyle VerticalAlign="Bottom" />
                          <OtherMonthDayStyle ForeColor="Gray" />
                          <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                          <SelectorStyle BackColor="#CCCCCC" />
                          <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                          <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                          <WeekendDayStyle BackColor="#FFFFCC" />
                      </asp:Calendar>
                  </td>
              </tr>
              <tr>
                  <td class="style24">
                      &nbsp;</td>
                  <td align="center">
                      <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" 
                          onselectedindexchanged="DropDownList7_SelectedIndexChanged">
                      </asp:DropDownList>
                  </td>
              </tr>
              <tr>
                  <td class="style24">
                      &nbsp;</td>
                  <td align="center">
                      Month</td>
              </tr>
              <tr>
                  <td class="style24">
                      &nbsp;</td>
                  <td align="center">
                      <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                          onselectedindexchanged="DropDownList7_SelectedIndexChanged">
                          <asp:ListItem>Jan</asp:ListItem>
                          <asp:ListItem>Feb</asp:ListItem>
                          <asp:ListItem>Mar</asp:ListItem>
                          <asp:ListItem>Apr</asp:ListItem>
                          <asp:ListItem>May</asp:ListItem>
                          <asp:ListItem>Jun</asp:ListItem>
                          <asp:ListItem>Jul</asp:ListItem>
                          <asp:ListItem>Aug</asp:ListItem>
                          <asp:ListItem>Sep</asp:ListItem>
                          <asp:ListItem>Oct</asp:ListItem>
                          <asp:ListItem>Nov</asp:ListItem>
                          <asp:ListItem>Dec</asp:ListItem>
                      </asp:DropDownList>
                  </td>
              </tr>
              <tr>
                  <td class="style24">
                      &nbsp;</td>
                  <td align="center">
                      Year</td>
              </tr>
              <tr>
                  <td class="style24">
                      </td>
                  <td align="center" valign="top">
                      <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" 
                          onselectedindexchanged="DropDownList7_SelectedIndexChanged">
                      </asp:DropDownList>
                  </td>
              </tr>
        </table> 
                    <table cellspacing="5" width="100%">
                        <tr>
                            <td>
                                Event Type</td>
                            <td align="left">
                                <asp:DropDownList ID="DropDownList10" runat="server">
                                    <asp:ListItem>Birthday</asp:ListItem>
                                    <asp:ListItem>Meeting</asp:ListItem>
                                    <asp:ListItem>Shopping</asp:ListItem>
                                    <asp:ListItem Value="Anniversary"></asp:ListItem>
                                    <asp:ListItem>Time Table</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Event Note</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td colspan="2" rowspan="8">
                                <asp:TextBox ID="TextBox7" runat="server" Columns="36" Rows="13" 
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <p>
                    </p>
                    <table cellspacing="5" width="100%">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table cellspacing="5" width="100%">
            <tr>
                <td align="center">
                    <input ID="Checkbox4" onclick="Checkbox4_onclick()" type="checkbox" name="alert" /><asp:Label 
                        ID="Label2" runat="server" Font-Names="Calibri" Font-Size="XX-Large" 
                        Text="Alert Me"></asp:Label>
                </td>
            </tr>
        </table> 
                    <table cellspacing="5" width="100%">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Calibri" 
                                    Font-Size="Large" Text="Remind me at : "></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <th align="center" >
                                Year</th>
                            <th align="center">
                                Month
                            </th>
                            <th align="center">
                                <asp:RadioButton ID="RadioButton1" runat="server" Text="Day of month"
                                   onClick="RadioButton1_Click();" Checked="True" 
                                    GroupName="day"/>
                            </th>
                            <th align="center">
                                <asp:RadioButton ID="RadioButton2" runat="server" Text="Day of week" 
                                   onClick="RadioButton1_Click();" GroupName="day" />
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Date</td>
                            <td align="center" >
                                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" onChange="ChangeDropDowns();" >
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" 
                                    onChange="ChangeDropDowns();" >
                                    <asp:ListItem>Every Month</asp:ListItem>
                                    <asp:ListItem>Jan</asp:ListItem>
                                    <asp:ListItem>Feb</asp:ListItem>
                                    <asp:ListItem>Mar</asp:ListItem>
                                    <asp:ListItem>Apr</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>Jun</asp:ListItem>
                                    <asp:ListItem>Jul</asp:ListItem>
                                    <asp:ListItem>Aug</asp:ListItem>
                                    <asp:ListItem>Sep</asp:ListItem>
                                    <asp:ListItem>Oct</asp:ListItem>
                                    <asp:ListItem>Nov</asp:ListItem>
                                    <asp:ListItem>Dec</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="DropDownList3" runat="server" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="DropDownList11" runat="server" Enabled="False">
                                    <asp:ListItem>Every Day</asp:ListItem>
                                    <asp:ListItem>Sun</asp:ListItem>
                                    <asp:ListItem>Mon</asp:ListItem>
                                    <asp:ListItem>Tue</asp:ListItem>
                                    <asp:ListItem>Wed</asp:ListItem>
                                    <asp:ListItem>Thu</asp:ListItem>
                                    <asp:ListItem>Fri</asp:ListItem>
                                    <asp:ListItem>Sat</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td >
                            </td>
                            <td>
                            </td>
                            <td colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <th align="center" >
                                Hour
                            </th>
                            <th align="center">
                                Minute
                            </th>
                            <th align="center">
                                Second
                            </th>
                            <th align="center">
                                &nbsp;</th>
                        </tr>
                        <tr>
                            <td>
                                Time
                            </td>
                            <td align="center" >
                                <asp:DropDownList ID="DropDownList4" runat="server" Enabled="False">
                                    <asp:ListItem>Every Hour</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="DropDownList5" runat="server" Enabled="False">
                                    <asp:ListItem>Every Minute</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem Value="7"></asp:ListItem>
                                    <asp:ListItem Value="8"></asp:ListItem>
                                    <asp:ListItem Value="9"></asp:ListItem>
                                    <asp:ListItem Value="10"></asp:ListItem>
                                    <asp:ListItem Value="11"></asp:ListItem>
                                    <asp:ListItem Value="12"></asp:ListItem>
                                    <asp:ListItem Value="13"></asp:ListItem>
                                    <asp:ListItem Value="14"></asp:ListItem>
                                    <asp:ListItem Value="15"></asp:ListItem>
                                    <asp:ListItem Value="16"></asp:ListItem>
                                    <asp:ListItem Value="17"></asp:ListItem>
                                    <asp:ListItem Value="18"></asp:ListItem>
                                    <asp:ListItem Value="19"></asp:ListItem>
                                    <asp:ListItem Value="20"></asp:ListItem>
                                    <asp:ListItem Value="21"></asp:ListItem>
                                    <asp:ListItem Value="22"></asp:ListItem>
                                    <asp:ListItem Value="23"></asp:ListItem>
                                    <asp:ListItem Value="24"></asp:ListItem>
                                    <asp:ListItem Value="25"></asp:ListItem>
                                    <asp:ListItem Value="26"></asp:ListItem>
                                    <asp:ListItem Value="27"></asp:ListItem>
                                    <asp:ListItem Value="28"></asp:ListItem>
                                    <asp:ListItem Value="29"></asp:ListItem>
                                    <asp:ListItem Value="30"></asp:ListItem>
                                    <asp:ListItem Value="31"></asp:ListItem>
                                    <asp:ListItem Value="32"></asp:ListItem>
                                    <asp:ListItem Value="33"></asp:ListItem>
                                    <asp:ListItem>34</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>36</asp:ListItem>
                                    <asp:ListItem>37</asp:ListItem>
                                    <asp:ListItem>38</asp:ListItem>
                                    <asp:ListItem>39</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>41</asp:ListItem>
                                    <asp:ListItem>42</asp:ListItem>
                                    <asp:ListItem>43</asp:ListItem>
                                    <asp:ListItem>44</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>46</asp:ListItem>
                                    <asp:ListItem>47</asp:ListItem>
                                    <asp:ListItem>48</asp:ListItem>
                                    <asp:ListItem>49</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>51</asp:ListItem>
                                    <asp:ListItem>52</asp:ListItem>
                                    <asp:ListItem>53</asp:ListItem>
                                    <asp:ListItem>54</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                    <asp:ListItem>56</asp:ListItem>
                                    <asp:ListItem>57</asp:ListItem>
                                    <asp:ListItem>58</asp:ListItem>
                                    <asp:ListItem>59</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="DropDownList6" runat="server" Enabled="False">
                                    <asp:ListItem>Every Second</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                    <asp:ListItem>32</asp:ListItem>
                                    <asp:ListItem>33</asp:ListItem>
                                    <asp:ListItem>34</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>36</asp:ListItem>
                                    <asp:ListItem>37</asp:ListItem>
                                    <asp:ListItem>38</asp:ListItem>
                                    <asp:ListItem>39</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>41</asp:ListItem>
                                    <asp:ListItem>42</asp:ListItem>
                                    <asp:ListItem>43</asp:ListItem>
                                    <asp:ListItem>44</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>46</asp:ListItem>
                                    <asp:ListItem>47</asp:ListItem>
                                    <asp:ListItem>48</asp:ListItem>
                                    <asp:ListItem>49</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>51</asp:ListItem>
                                    <asp:ListItem>52</asp:ListItem>
                                    <asp:ListItem>53</asp:ListItem>
                                    <asp:ListItem>54</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                    <asp:ListItem>56</asp:ListItem>
                                    <asp:ListItem>57</asp:ListItem>
                                    <asp:ListItem>58</asp:ListItem>
                                    <asp:ListItem>59</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="DropDownList12" runat="server" Enabled="False">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table cellspacing="5">
                        <tr>
                            <td colspan="2">
                                <input ID="Checkbox5" type="checkbox" name="mail" DISABLED onclick="return Checkbox5_onclick()" /><asp:Label ID="Label3" runat="server" 
                                    Text="Send Mail"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp; &nbsp;</td>
                            <td>
                                To
                            </td>
                            <td class="style23">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="*" 
                                    ValidationGroup="AddReminder" Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style19" colspan="2">
                                <asp:TextBox ID="TextBox1" runat="server" Columns="69" Enabled="False" 
                                    Font-Names="Calibri" Width="276px"></asp:TextBox>
                            </td>
                            <td class="style21">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="Invalid E-Mail Id" Font-Size="Small" 
                                    ValidationGroup="AddReminder" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    Enabled="False"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp; &nbsp;</td>
                            <td>
                                Subject
                            </td>
                            <td class="style23">
                                &nbsp;&nbsp;
                                </td>
                            <td class="style22">
                                <asp:TextBox ID="TextBox2" runat="server" Columns="69" Enabled="False" 
                                    Font-Names="Calibri" Width="276px"></asp:TextBox>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; &nbsp;</td>
                            <td>
                                Body
                            </td>
                            <td rowspan="3">
                                &nbsp;</td>
                            <td rowspan="3">
                                <asp:TextBox ID="TextBox3" runat="server" Columns="57" Enabled="False" 
                                    Font-Names="Calibri" Rows="10" TextMode="MultiLine" Width="277px"></asp:TextBox>
                            </td>
                            <td rowspan="3">
                                &nbsp;</td>
                            <td rowspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td colspan="4">
                                <input ID="Checkbox1" type="checkbox" name="message" DISABLED onclick="return Checkbox1_onclick()" /><asp:Label ID="Label4" runat="server" 
                                    Text="Send Message"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                &nbsp;&nbsp; &nbsp;</td>
                            <td class="style18">
                                Mobile Number
                            </td>
                            <td class="style17">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="*" 
                                    ValidationGroup="AddReminder" Enabled="False"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="TextBox4" runat="server" Columns="32" Font-Names="Calibri" 
                                    Enabled="False" Width="217px"></asp:TextBox>
                            </td>
                            <td class="style18">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="Invalid Mobile Number" 
                                    Font-Size="Small" ValidationExpression="\d{10}" 
                                    ValidationGroup="AddReminder" Enabled="False"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; &nbsp;</td>
                            <td>
                                Message</td>
                            <td rowspan="3" colspan="2">
                                &nbsp;&nbsp;
                                <asp:TextBox ID="TextBox6" runat="server" Columns="30" Font-Names="Calibri" 
                                    Rows="10" TextMode="MultiLine" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp; &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="Button1" runat="server" Font-Names="Calibri" 
                                    Font-Size="X-Large" Height="40px" onclick="Button1_Click" Text="Add Remainder" 
                                    Width="200px" ValidationGroup="AddReminder" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </div>
        <br /><br /><br /><br />
    </asp:Panel>            
            </td>
        </tr>
    </table>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

   