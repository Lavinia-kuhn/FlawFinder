using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using Dapper;
using System.Linq;
using System.Collections.Generic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class UserRepository : IUserRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public UserRepository(PCFactoryManagementViewDataContext Context,
            ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public GetUserQueryResult GetByCode(string code)
        {
            _log.LogInformation("UserRepository: GetByCode");
            var user = 
                _context
                .Connection
                .Query<GetUserQueryResult>(
                @"SELECT 
                    A.IDUser as 'IdUser',
                    A.Code as 'Code',
                    A.Name as 'Name',
                    A.Nickname as 'Nickname',
                    A.Password as 'Password',
                    A.IDLanguage as 'Language',
                    A.Email as 'Email',
                    (SELECT ParamValue FROM TBLParams WHERE ParamName = 'IDUserDefaultAdmin') as 'idDefaultAdmin'
                FROM TBLUser A
                WHERE 
                    A.FlgEnable = 1 AND 
                    A.Code = @Code",
                new { Code = code })
                .FirstOrDefault();

            if (user != null)
            {
                var userRoles =
                    _context
                    .Connection
                    .Query<string>(
                        @"SELECT 
                            SCREEN.ShortCut
                        FROM TBLScreenMenus Coleta
                            INNER JOIN TBLScreenMenus PCF
                            ON Coleta.IDSuperiorScreenMenu = PCF.IDScreenMenu
                            INNER JOIN TBLScreenMenus SCREEN
                            ON Coleta.IDScreenMenu = SCREEN.IDSuperiorScreenMenu
                            INNER JOIN TBLOperationScreen OPERSCREEN
                            ON SCREEN.IDScreen = OPERSCREEN.IDScreen
                            INNER JOIN TBLProfileUserGroup PROF
                            ON OPERSCREEN.IDOperationScreen = PROF.IDOperationScreen
                            INNER JOIN TBLUsrGroup USRGRP
                            ON PROF.IDUsrGroup = USRGRP.IDUsrGroup
                            INNER JOIN TBLUsrGroupUser USRGRPUSR
                            ON USRGRP.IDUsrGroup = USRGRPUSR.IDUsrGroup
                            INNER JOIN TBLUser USR
                            ON USR.IDUser = USRGRPUSR.IDUser
                        WHERE
                            PCF.Code = 'PCF4View'
                            AND PCF.FlgEnable = 1
                            AND Coleta.FlgEnable = 1
                            AND SCREEN.FlgEnable = 1
                            AND SCREEN.ShortCut IS NOT NULL
                            AND USRGRP.FlgEnable = 1
                            AND USR.FlgEnable = 1
                            AND USR.IDUser = @IdUser
                        UNION 
                        SELECT 
                            OPERSCREEN.Operation
                        FROM TBLScreen Coleta
                            INNER JOIN TBLAplication PCF
                            ON Coleta.IDAplication = PCF.IDAplication
                            INNER JOIN TBLOperationScreen OPERSCREEN
                            ON cOLETA.IDScreen = OPERSCREEN.IDScreen
                            INNER JOIN TBLProfileUserGroup PROF
                            ON OPERSCREEN.IDOperationScreen = PROF.IDOperationScreen
                            INNER JOIN TBLUsrGroup USRGRP
                            ON PROF.IDUsrGroup = USRGRP.IDUsrGroup
                            INNER JOIN TBLUsrGroupUser USRGRPUSR
                            ON USRGRP.IDUsrGroup = USRGRPUSR.IDUsrGroup
                            INNER JOIN TBLUser USR
                            ON USR.IDUser = USRGRPUSR.IDUser
                        WHERE
                            PCF.Code = 'PCF4View'
                            AND USRGRP.FlgEnable = 1
                            AND USR.FlgEnable = 1
                            AND USR.IDUser = @idUser
                            AND Coleta.Code = 'ANDON'
                        UNION 
                        SELECT 
                            OPERSCREEN.Operation
                        FROM TBLScreen Coleta
                            INNER JOIN TBLAplication PCF
                            ON Coleta.IDAplication = PCF.IDAplication
                            INNER JOIN TBLOperationScreen OPERSCREEN
                            ON cOLETA.IDScreen = OPERSCREEN.IDScreen
                            INNER JOIN TBLProfileUserGroup PROF
                            ON OPERSCREEN.IDOperationScreen = PROF.IDOperationScreen
                            INNER JOIN TBLUsrGroup USRGRP
                            ON PROF.IDUsrGroup = USRGRP.IDUsrGroup
                            INNER JOIN TBLUsrGroupUser USRGRPUSR
                            ON USRGRP.IDUsrGroup = USRGRPUSR.IDUsrGroup
                            INNER JOIN TBLUser USR
                            ON USR.IDUser = USRGRPUSR.IDUser
                        WHERE
                            PCF.Code = 'PCF4View'
                            AND USRGRP.FlgEnable = 1
                            AND USR.FlgEnable = 1
                            AND USR.IDUser = @idUser
                            AND Coleta.Code = 'VIEWOEEMAP'
                        UNION 
                        SELECT 
                            OPERSCREEN.Operation
                        FROM TBLScreen Coleta
                            INNER JOIN TBLAplication PCF
                            ON Coleta.IDAplication = PCF.IDAplication
                            INNER JOIN TBLOperationScreen OPERSCREEN
                            ON cOLETA.IDScreen = OPERSCREEN.IDScreen
                            INNER JOIN TBLProfileUserGroup PROF
                            ON OPERSCREEN.IDOperationScreen = PROF.IDOperationScreen
                            INNER JOIN TBLUsrGroup USRGRP
                            ON PROF.IDUsrGroup = USRGRP.IDUsrGroup
                            INNER JOIN TBLUsrGroupUser USRGRPUSR
                            ON USRGRP.IDUsrGroup = USRGRPUSR.IDUsrGroup
                            INNER JOIN TBLUser USR
                            ON USR.IDUser = USRGRPUSR.IDUser
                        WHERE
                            PCF.Code = 'PCF4View'
                            AND USRGRP.FlgEnable = 1
                            AND USR.FlgEnable = 1
                            AND USR.IDUser = @idUser
                            AND Coleta.Code = 'GLOBAL_MV_REPORT'",
                    new { IdUser = user.IdUser })
                    .ToList();

                var userGroups = _context.Connection.Query<string>(@"
                    SELECT
	                    A.IDUsrGroup
                    FROM TBLUsrGroup A
                    INNER JOIN TBLUsrGroupUser B
	                    ON B.IDUsrGroup = A.IDUsrGroup
                    INNER JOIN TBLUser C
	                    ON C.IDUser = B.IDUser
                    WHERE C.IDUser = @idUser"
                , new { idUser = user.IdUser }).ToList();

                user.Roles.AddRange(userRoles);
                user.GroupId.AddRange(userGroups);
            }

            return user;

        }

        public bool isAdLogin()
        {
            var qry = 
                @"
                SELECT ParamValue 
                FROM TBLParams 
                WHERE 
                    ParamName = 'AuthenticationType'
                    AND ParamOwner = 'System'
                    AND FlgProduct = 1
                    AND FlgV4 = 1";
            var result = _context.Connection.Query<string>(qry).FirstOrDefault();
            var isAd = false;
            if (result != null)
            {
                isAd = (result == "1" || result == "2");
            }
            
            return isAd;
        }

        public string AdLoginType()
        {
            var qry =
                @"
                SELECT ParamValue 
                FROM TBLParams 
                WHERE 
                    ParamName = 'AuthenticationType'
                    AND ParamOwner = 'System'
                    AND FlgProduct = 1
                    AND FlgV4 = 1";
            var result = _context.Connection.Query<string>(qry).FirstOrDefault();
            return result;
        }

        public List<int> GetIdsUsrGrp(int idUser)
        {
            var userGroups = _context.Connection.Query<int>(@"
                    SELECT
	                    A.IDUsrGroup
                    FROM TBLUsrGroup A
                    INNER JOIN TBLUsrGroupUser B
	                    ON B.IDUsrGroup = A.IDUsrGroup
                    INNER JOIN TBLUser C
	                    ON C.IDUser = B.IDUser
                    WHERE C.IDUser = @idUser"
               , new { idUser = idUser }).ToList();

            return userGroups;
        }

        public List<UserQueryResult> GetAllCodeUser()
        {
            _log.LogInformation("UserRepository: GetAllCodeUser");
            var qry = $@"
				SELECT 
                A.IDUser 'UserId', 
                A.Code AS 'UserCode'
                from TBLUser A
                ORDER BY A.Code";

            return _context.Connection.Query<UserQueryResult>(qry).ToList();
        }

        public List<UserQueryResult> GetPageCodeUser(int pPage, int pSize)
        {
            _log.LogInformation("UserRepository: GetPageCodeUser");
            var qry = $@"
				SELECT 
                A.IDUser 'UserId', 
                A.Code AS 'UserCode'
                from TBLUser A
                ORDER BY A.Code";

            return _context.Connection.Query<UserQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }

        public List<UserQueryResult> GetCodeUserByCode(string code)
        {
            _log.LogInformation("UserRepository: GetCodeUserByCode");
            var count = "100";
            var qry = $@"
				SELECT 
                A.IDUser 'UserId', 
                A.Code AS 'UserCode'
                from TBLUser A
                WHERE A.CODE LIKE '{code}%'
                ORDER BY A.Code
                ";

            return _context.Connection.Query<UserQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
