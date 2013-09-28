<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RemindersList.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function RadioButton1_Click() {
            var R1Checked = document.getElementById("<%= RadioButton1.Value %>").checked;
            document.getElementById("<%= DropDownList3.Value %>").disabled = !R1Checked;
            document.getElementById("<%= DropDownList11.Value %>").disabled = R1Checked;
        }

        function ClearDroDown(DropDown) {
            var intTotalItems = DropDown.options.length;

            //loop through the number of items
            for (var intCounter = intTotalItems; intCounter >= 0; intCounter--) {
                //remove the intCounter( currently index) item from the dropDownList
                DropDown.remove(intCounter);
            }
        }

        function daysInMonth(iMonth, iYear) {
            return 32 - new Date(iYear, iMonth, 32).getDate();
        }

        function ChangeDropDowns() {
            var DropDown1 = document.getElementById("<%= DropDownList1.Value %>");
            var DropDown2 = document.getElementById("<%= DropDownList2.Value %>");
            var DropDown3 = document.getElementById("<%= DropDownList3.Value %>");
            var selectedDay = DropDown3.selectedIndex;
            ClearDroDown(DropDown3);
            var temp = document.createElement("option");
            temp.text = "Every Day";
            temp.text = "Every Day";
            DropDown3.options.add(temp);
            var selectedYear = DropDown1.options[DropDown1.selectedIndex].text;
            var selectedMonth = DropDown2.selectedIndex - 1;
            for (var i = 1; i <= daysInMonth(selectedMonth, selectedYear); i++) {
                var newOption = document.createElement("option");
                newOption.text = i;
                newOption.value = i;
                DropDown3.options.add(newOption);
            }
            DropDown3.selectedIndex = selectedDay;
            alert("Completed");
        }

        function SelectAll(obj)
        {
            //get reference of GridView control
            var grid = document.getElementById("<%= GridView1.ClientID %>");
            //variable to contain the cell of the grid
            var cell;
            
            if (grid.rows.length > 0)
            {
                //loop starts from 1. rows[0] points to the header.
                for (i=1; i<grid.rows.length; i++)
                {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];
                    
                    //loop according to the number of childNodes in the cell
                    for (j=0; j<cell.childNodes.length; j++)
                    {           
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type =="checkbox")
                        {
                        //assign the status of the Select All checkbox to the cell checkbox within the grid
                            cell.childNodes[j].checked = obj.checked;
                        }
                    }
                }
            }
        }
        
    </script>
    <style type="text/css">
        .style12
        {
            width: 100%;
        }
        .style19
        {
            height: 28px;
        }
        .style20
        {
            height: 29px;
        }
        .style21
        {
            height: 26px;
        }
        .style22
        {
            height: 28px;
            width: 104px;
        }
        .style23
        {
            width: 104px;
        }
        .style24
        {
            height: 29px;
            width: 104px;
        }
        .headder
        {
            font-family:Calibri;    
        }
        a{ text-decoration:none;}
        .style25
        {
            width: 100%;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="Id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
        Width="100%" BorderStyle="None" 
        CssClass="headder" onrowdeleting="GridView1_RowDeleting" >
        <AlternatingRowStyle BackColor="#CCCCCC" ForeColor="Black" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("Id") %>' CommandName="Edit" 
                        onclick="LinkButton2_Click1" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Date" SortExpression="Event_Date">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" 
                        SelectedDate='<%# Bind("Event_Date") %>'></asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Event_Date") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Type" SortExpression="Event_Type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Event_Type") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Event_Type") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Note" SortExpression="Event_Note">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Height="133px" 
                        Text='<%# Bind("Event_Note") %>' TextMode="MultiLine" Width="184px" 
                        Rows="10"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Event_Note") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mail" SortExpression="Mails_Id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Mails_Id") %>' 
                        Visible="False" Height="22px" Width="127px" 
                        ondatabinding="TextBox4_DataBinding" ></asp:TextBox>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" 
                        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                        onitemupdated="FormView1_ItemUpdated" >
                        <EditItemTemplate>
                            &nbsp;<asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' 
                                Visible="False" />
                            <table class="style12">
                                <tr>
                                    <td>
                                        To_Address:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="To_AddressTextBox" runat="server" 
                                            Text='<%# Bind("To_Address") %>' />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="To_AddressTextBox" ErrorMessage="*" ValidationGroup="mail"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="To_AddressTextBox" ErrorMessage="Invalid E-Mail Id" 
                                            Font-Names="Calibri" Font-Size="Small" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                            ValidationGroup="mail"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Subject:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Body:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" ValidationGroup="mail" 
                                            onclick="UpdateButton_Click" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            &nbsp;<asp:TextBox ID="Clock_IdTextBox" runat="server" 
                                Text='<%# Bind("Clock_Id") %>' Visible="False" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table class="style25">
                                <tr>
                                    <td>
                                        To_Address:</td>
                                    <td>
                                        <asp:TextBox ID="To_AddressTextBox" runat="server" 
                                            Text='<%# Bind("To_Address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Subject:</td>
                                    <td>
                                        <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Body:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Clock_Id:</td>
                                    <td>
                                        <asp:TextBox ID="Clock_IdTextBox" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                    </td>
                                </tr>
                            </table>
                            &nbsp;&nbsp;<br />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' 
                                Visible="False" />
                            <table class="style12">
                                <tr>
                                    <td>
                                        To_Address:
                                    </td>
                                    <td>
                                        <asp:Label ID="To_AddressLabel" runat="server" 
                                            Text='<%# Bind("To_Address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;Subject:</td>
                                    <td>
                                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Body:
                                    </td>
                                    <td>
                                        <asp:Label ID="BodyLabel" runat="server" Text='<%# Bind("Body") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" Visible="False" />
                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="New" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            &nbsp;<asp:Label ID="Clock_IdLabel" runat="server" Text='<%# Bind("Clock_Id") %>' 
                                Visible="False" />
                            &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:reminderConnectionString %>" 
                        DeleteCommand="DELETE FROM [Mails] WHERE [Id] = @Id" 
                        InsertCommand="INSERT INTO [Mails] ([To_Address], [Subject], [Body], [Clock_Id]) VALUES (@To_Address, @Subject, @Body, @Clock_Id)"
                        ProviderName="<%$ ConnectionStrings:reminderConnectionString.ProviderName %>" 
                        SelectCommand="SELECT [Id], [To_Address], [Subject], [Body], [Clock_Id] FROM [Mails] WHERE ([Id] = @Id)" 
                        UpdateCommand="UPDATE [Mails] SET [To_Address] = @To_Address, [Subject] = @Subject, [Body] = @Body, [Clock_Id] = @Clock_Id WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="To_Address" Type="String" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Body" Type="String" />
                            <asp:Parameter Name="Clock_Id" Type="Int64" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox4" Name="Id" PropertyName="Text" 
                                Type="Int64" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="To_Address" Type="String" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Body" Type="String" />
                            <asp:Parameter Name="Clock_Id" Type="Int64" />
                            <asp:Parameter Name="Id" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Mails_Id") %>' 
                        Visible="False"></asp:Label>
                    <asp:Image ID="Image1" runat="server" Visible='<%# !(Eval("Mails_Id").ToString().Equals(DEFAULT_MLID+"")) %>'
                        Height="28px" ImageUrl="~/Mailnew.png" Width="28px" />
                    <br />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Message" SortExpression="Messages_Id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Messages_Id") %>' 
                        Visible="False"></asp:TextBox>
                    <br />
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="Id" 
                        DataSourceID="SqlDataSource2" EnableModelValidation="True" 
                        onitemupdated="FormView2_ItemUpdated">
                        <EditItemTemplate>
                            &nbsp;<asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' 
                                Visible="False" />
                            <table class="style12">
                                <tr>
                                    <td>
                                        Dest_Number:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Dest_NumberTextBox" runat="server" 
                                            Text='<%# Bind("Dest_Number") %>' />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="Dest_NumberTextBox" ErrorMessage="*" 
                                            ValidationGroup="message"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                            ControlToValidate="Dest_NumberTextBox" ErrorMessage="Invalid Mobile Number" 
                                            Font-Names="Calibri" Font-Size="Small" ValidationExpression="\d{10}" 
                                            ValidationGroup="message"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Message:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MessageTextBox" runat="server" Text='<%# Bind("Message") %>' />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" ValidationGroup="message" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <asp:TextBox ID="Clock_IdTextBox" runat="server" Text='<%# Bind("Clock_Id") %>' 
                                Visible="False" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Dest_Number:
                            <asp:TextBox ID="Dest_NumberTextBox" runat="server" 
                                Text='<%# Bind("Dest_Number") %>' />
                            <br />
                            Message:
                            <asp:TextBox ID="MessageTextBox" runat="server" Text='<%# Bind("Message") %>' />
                            <br />
                            Clock_Id:
                            <asp:TextBox ID="Clock_IdTextBox" runat="server" />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' 
                                Visible="False" />
                            <table class="style12">
                                <tr>
                                    <td>
                                        Dest_Number:
                                    </td>
                                    <td>
                                        <asp:Label ID="Dest_NumberLabel" runat="server" 
                                            Text='<%# Bind("Dest_Number") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Message:
                                    </td>
                                    <td>
                                        <asp:Label ID="MessageLabel" runat="server" Text='<%# Bind("Message") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" Visible="False" />
                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="New" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Label ID="Clock_IdLabel" runat="server" Text='<%# Bind("Clock_Id") %>' 
                                ondatabinding="Clock_IdLabel_DataBinding" Visible="False"  />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:reminderConnectionString %>" 
                        DeleteCommand="DELETE FROM [Messages] WHERE [Id] = @Id" 
                        InsertCommand="INSERT INTO [Messages] ([Dest_Number], [Message], [Clock_Id]) VALUES (@Dest_Number, @Message, @Clock_Id)" 
                        ProviderName="<%$ ConnectionStrings:reminderConnectionString.ProviderName %>" 
                        SelectCommand="SELECT [Id], [Dest_Number], [Message], [Clock_Id] FROM [Messages] WHERE ([Id] = @Id)" 
                        UpdateCommand="UPDATE [Messages] SET [Dest_Number] = @Dest_Number, [Message] = @Message, [Clock_Id] = @Clock_Id WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Dest_Number" Type="String" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="Clock_Id" Type="Int64" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox5" Name="Id" PropertyName="Text" 
                                Type="Int64" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Dest_Number" Type="String" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="Clock_Id" Type="Int64" />
                            <asp:Parameter Name="Id" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Messages_Id") %>' 
                        Visible="False"></asp:Label>
                    <asp:Image ID="Image2" runat="server" 
                        Visible='<%# !(Eval("Messages_Id").ToString().Equals(DEFAULT_MSGID+"")) %>' Height="32px" 
                        ImageUrl="~/Mobile.png" Width="30px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Panel ID="Panel2" runat="server" Height="207px" 
                         Width="478px">
                        <asp:Panel ID="Panel1" runat="server" BackColor="#999999" Enabled="False" 
                            Height="180px" oninit="Panel1_Init" Width="480px">
                            <table cellspacing="5" width="100%">
                                <tr>
                                    <th class="style19">
                                    </th>
                                    <th align="center" class="style19">
                                        Year</th>
                                    <th align="center" class="style19">
                                        Month
                                    </th>
                                    <th align="center" class="style19">
                                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" 
                                            GroupName="day" onClick="RadioButton1_Click();" 
                                            ondatabinding="RadioButton1_DataBinding" oninit="RadioButton1_Init" 
                                            Text="Day of month" />
                                    </th>
                                    <th align="center" class="style22">
                                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="day" 
                                            onClick="RadioButton1_Click();" ondatabinding="RadioButton2_DataBinding" 
                                            oninit="RadioButton2_Init" Text="Day of week" />
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        Date</td>
                                    <td align="center">
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            onChange="ChangeDropDowns();" ondatabinding="DropDownList1_DataBinding" 
                                            oninit="DropDownList1_Init">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center">
                                        <asp:DropDownList ID="DropDownList2" runat="server" 
                                            onChange="ChangeDropDowns();" ondatabinding="DropDownList2_DataBinding" 
                                            oninit="DropDownList2_Init">
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
                                        <asp:DropDownList ID="DropDownList3" runat="server" 
                                            ondatabinding="DropDownList3_DataBinding" oninit="DropDownList3_Init">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" class="style23">
                                        <asp:DropDownList ID="DropDownList11" runat="server" 
                                            ondatabinding="DropDownList11_DataBinding" oninit="DropDownList11_Init">
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
                                    <td class="style21">
                                    </td>
                                    <td class="style21">
                                    </td>
                                    <td class="style21">
                                    </td>
                                    <td class="style21" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                    </th>
                                    <th align="center">
                                        Hour
                                    </th>
                                    <th align="center">
                                        Minute
                                    </th>
                                    <th align="center">
                                        Second
                                    </th>
                                    <th align="center" class="style23">
                                        &nbsp;</th>
                                </tr>
                                <tr>
                                    <td class="style20">
                                        Time
                                    </td>
                                    <td align="center" class="style20">
                                        <asp:DropDownList ID="DropDownList4" runat="server" 
                                            ondatabinding="DropDownList4_DataBinding" oninit="DropDownList4_Init">
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
                                    <td align="center" class="style20">
                                        <asp:DropDownList ID="DropDownList5" runat="server" 
                                            ondatabinding="DropDownList5_DataBinding" oninit="DropDownList5_Init">
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
                                    <td align="center" class="style20">
                                        <asp:DropDownList ID="DropDownList6" runat="server" 
                                            ondatabinding="DropDownList6_DataBinding" oninit="DropDownList6_Init">
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
                                    <td align="center" class="style24">
                                        <asp:DropDownList ID="DropDownList12" runat="server" 
                                            ondatabinding="DropDownList12_DataBinding" oninit="DropDownList12_Init">
                                            <asp:ListItem>AM</asp:ListItem>
                                            <asp:ListItem>PM</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                                            oninit="LinkButton1_Init" Visible="False">Update</asp:LinkButton>
                                    </td>
                                    <td colspan="2">
                                        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" 
                                            oninit="LinkButton2_Init" Visible="False">Cancel</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
                            oninit="LinkButton3_Init">Edit</asp:LinkButton>
                        <br />
                        <br />
                    </asp:Panel>
                </EditItemTemplate>
                <FooterTemplate>
                    <a Href="javascript:__doPostBack('GridView1','Sort$Mails_Id')" 
                        style="color:White;">Mails_Id</a>
                </FooterTemplate>
                <ItemTemplate>
                    &nbsp;
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1_1" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("Id") %>' CommandName="Delete" 
                        onclick="LinkButton1_Click1" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" 
            Font-Strikeout="False" Font-Underline="False" />
        <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:reminderConnectionString %>" 
        DeleteCommand="DELETE FROM [Remainder] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Remainder] ([Event_Date], [Event_Type], [Event_Note], [Mails_Id], [Messages_Id]) VALUES (@Event_Date, @Event_Type, @Event_Note, @Mails_Id, @Messages_Id)" 
        ProviderName="<%$ ConnectionStrings:reminderConnectionString.ProviderName %>" 
        SelectCommand="SELECT [Id], [Event_Date], [Event_Type], [Event_Note], [Mails_Id], [Messages_Id] FROM [Remainder] WHERE ([User_Name] = @User_Name)" 
        UpdateCommand="UPDATE [Remainder] SET [Event_Date] = @Event_Date, [Event_Type] = @Event_Type, [Event_Note] = @Event_Note, [Mails_Id] = @Mails_Id, [Messages_Id] = @Messages_Id WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Event_Date" Type="DateTime" />
            <asp:Parameter Name="Event_Type" Type="String" />
            <asp:Parameter Name="Event_Note" Type="String" />
            <asp:Parameter Name="Mails_Id" Type="Int64" />
            <asp:Parameter Name="Messages_Id" Type="Int64" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="User_Name" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Event_Date" Type="DateTime" />
            <asp:Parameter Name="Event_Type" Type="String" />
            <asp:Parameter Name="Event_Note" Type="String" />
            <asp:Parameter Name="Mails_Id" Type="Int64" />
            <asp:Parameter Name="Messages_Id" Type="Int64" />
            <asp:Parameter Name="Id" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="DropDownList1" runat="server" />
    <asp:HiddenField ID="DropDownList2" runat="server" />
    <asp:HiddenField ID="DropDownList3" runat="server" />
    <asp:HiddenField ID="DropDownList11" runat="server" />
    <asp:HiddenField ID="DropDownList4" runat="server" />
    <asp:HiddenField ID="DropDownList5" runat="server" />
    <asp:HiddenField ID="DropDownList6" runat="server" />
    <asp:HiddenField ID="DropDownList12" runat="server" />
    <asp:HiddenField ID="RadioButton1" runat="server" />
    <asp:HiddenField ID="RadioButton2" runat="server" />
    </asp:Content>

